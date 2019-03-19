import cv2
import  numpy as np
import os
from datetime import datetime

def take_cam_image():
	# Open webcam
	camera_port = 0
	camera = cv2.VideoCapture(camera_port)
	return_value, image = camera.read()

	while True:
		return_value, image = camera.read()
		cv2.imshow('my webcam', image)

		if cv2.waitKey(1) == 27:# esc-key to quit
			break

	camera.release()
	cv2.destroyAllWindows()
	# return taken picture
	return image


def orange_filter(image):
	# define the list of boundaries B G R
	# Light rgb(255,255,204):  	255 204 255
	# Dark rgb(204,204,0): 		204 0 204
	boundaries = [
		([0, 120, 150], [150, 255, 255])
	]

	# loop over the boundaries
	for (lower, upper) in boundaries:
		# create NumPy arrays from the boundaries
		lower = np.array(lower, dtype = "uint8")
		upper = np.array(upper, dtype = "uint8")

		# find the colors within the specified boundaries and apply the mask
		mask = cv2.inRange(image, lower, upper)
		output = cv2.bitwise_and(image, image, mask = mask)

		# show the images
		#cv2.imshow("images", np.hstack([image, output]))
		#cv2.waitKey(0)

	# define hsv/hsb color
	hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

	# yellow boundaries in HSB: Hue/Color, Saturation, Brightness
	lower = np.array([10, 1, 150])
	upper = np.array([30, 255, 255])

	# define mask
	mask = cv2.inRange(hsv, lower, upper)
	mask = cv2.bitwise_not(mask)

	# background
	bk = np.full(image.shape, 255, dtype=np.uint8)

	# get masked foreground
	fg_masked = cv2.bitwise_and(image, image, mask=mask)

	# get masked background, mask must be inverted
	mask = cv2.bitwise_not(mask)
	bk_masked = cv2.bitwise_and(bk, bk, mask=mask)

	# change yellow parts to white
	final = cv2.bitwise_or(fg_masked, bk_masked)
	mask = cv2.bitwise_not(mask)

	return final, mask


def handle_outputs(out, out_filter):
	# fourth row of the output contains the predicted result
	result_no_filter = out.split('\n')[3]
	result_filter = out_filter.split('\n')[3]

	# find predicted sign and score
	sign1 = result_no_filter.split()
	sign2 = result_filter.split()
	score1 = float(sign1[1][7:-1])
	score2 = float(sign2[1][7:-1])

	# return the one with highest score
	if(sign1[0] == sign2[0]):
		score = max([score1, score2])
		return sign1[0], score

	else:
		if(score1 > score2):
			return sign1[0], score1
		else:
			return sign2[0], score2


def handle_output(out):
	# same as function handle_outputs, but with a single output
	result_no_filter = out.split('\n')[3]
	sign1 = result_no_filter.split()
	score1 = float(sign1[1][7:-1])
	return sign1[0], score1


def run_tf_model(use_filter):
	# run different tensorflow scripts depending on if the filter is used or not
	if(use_filter):
		output_filter = os.popen('python -m '
								 'scripts.label_image '
								 '--graph=tf_files/retrained_graph.pb '
								 '--image=res.png').read()

		return output_filter

	elif(not use_filter):
		output_no_filter = os.popen('python -m scripts.label_image '
									'--graph=tf_files/retrained_graph.pb '
									'--image=image.png').read()
		return output_no_filter



if __name__ == '__main__':
	#start timer
	start_time = datetime.now()
	use_orange_filter = True

	# take picture with cam
	image = take_cam_image()

	if(use_orange_filter):
		# apply orange filter, for swedish traffic signs
		final, mask = orange_filter(image)

		# save results
		#cv2.imwrite("mask.png", mask)
		cv2.imwrite("res.png", final)

	else:
		cv2.imwrite("image.png", image)

	# run tf model with pictures with and without orange filter
	os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2' #Just disables the warning, doesn't enable AVX/FMA
	out = run_tf_model(use_orange_filter)

	# get the result from the output
	#result, score = handle_outputs(output_no_filter, output_filter)
	result, score = handle_output(out)
	print(result)
	print(score)

	# end timer
	time_elapsed = datetime.now() - start_time
	print('Time elapsed (hh:mm:ss.ms) {}'.format(time_elapsed))



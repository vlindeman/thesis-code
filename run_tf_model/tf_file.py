import os
import glob
import subprocess
from datetime import datetime

def handle_output(out):
    # same as function handle_outputs, but with a single output
    result = out.split('\n')[3]
    sign = result.split()
    score = float(sign[1][7:-1])
    return sign[0], score


if __name__ == '__main__':
    # start timer
    start_time = datetime.now()
    counter = 0
    correct = 0

    #sign to test
    sign_number = 'test_enkelriktat'
    sign_name = 'cinfart'

    # loop over all files in folder
    for filename in glob.glob('testbilder/' + sign_number + '/*.jpg'):
        os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'  # Just disables the warning, doesn't enable AVX/FMA
        # script to run tf model
        out = os.popen('python -m scripts.label_image --graph=tf_files/retrained_graph.pb --image=' + filename).read()
        sign, score = handle_output(out)

        # if identified correct
        if (sign == sign_name):
            correct += 1

        print(counter)
        counter += 1

        print()
        print(correct)
        print(counter)
        print(float(correct / counter))

    # end timer
    time_elapsed = datetime.now() - start_time
    print('Time elapsed (hh:mm:ss.ms) {}'.format(time_elapsed))


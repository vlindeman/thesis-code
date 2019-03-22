import base64

# Open file containing base64 string
filepath = "Output.txt"
fi0 = open(filepath, "r")
encoded_img = fi0.read()

# Convert base64 to png
image_64_decode = base64.b64decode(encoded_img)
image_result = open('decode.png', 'wb') # create a writable image and write the decoding result
image_result.write(image_64_decode)

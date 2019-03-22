import os
import base64
from flask import Flask, flash, request, redirect, url_for
from werkzeug.utils import secure_filename


UPLOAD_FOLDER = '/home/ubuntu/flask-serv/'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/", methods=['GET', 'POST'])
def main(): 
    if request.method == 'GET':
        data = request.args.get('file')
        text_file = open(UPLOAD_FOLDER + "Output.txt", "w")
        text_file.write(data)
        text_file.close()

        # Open file containing base64 string
        filepath = UPLOAD_FOLDER + "Output.txt"
        fi0 = open(filepath, "r")
        encoded_img = fi0.read()

        # Convert base64 to png
        image_64_decode = base64.b64decode(encoded_img)
        image_result = open('decode.png', 'wb')  # create a writable image and write the decoding result
        image_result.write(image_64_decode)

        if 'file' not in request.files:
            return "GET request - no file"

        return "GET request OK"


    elif request.method == 'POST':
        return 'POST request'

    else:
        return "Error 405 Method Not Allowed"

if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=80)




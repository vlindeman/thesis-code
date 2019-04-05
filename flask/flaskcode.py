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

        if 'file' not in request.files:
            return "400 GET request no file"

        # Open file containing base64 string
        filepath = UPLOAD_FOLDER + "Output.txt"
        fi0 = open(filepath, "r")
        encoded_img = fi0.read()

        # Convert base64 to png
        image_64_decode = base64.b64decode(encoded_img)
        image_result = open('decode.png', 'wb')  # create a writable image and write the decoding result
        image_result.write(image_64_decode)
        return "200 GET request OK"

    elif request.method == 'POST':
        print(request.args)
        print(request.form)
        return '200 POST request'

        data = request.args.get('file')
        print(data)
        # if user does not select file, browser also
        # submit a empty part without filename
        if data == 'None':
            return '400 No selected file'

        text_file = open(UPLOAD_FOLDER + "Output.txt", "w")
        text_file.write(data)
        text_file.close()

        return '200 POST request OK'

    else:
        return "Error 405 Method Not Allowed"


if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=80)

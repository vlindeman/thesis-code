import os
import base64
from flask import Flask, flash, request, redirect, url_for
from werkzeug.utils import secure_filename


UPLOAD_FOLDER = '/home/ubuntu/flask-serv/'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


# handles the output format from tensorflow
def handle_output(out):
    result_no_filter = out.split('\n')[3]
    sign1 = result_no_filter.split()
    score1 = float(sign1[1][7:-1])
    return sign1[0], score1


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route("/", methods=['GET', 'POST'])
def main():
    if request.method == 'GET':
        # save base64 string to .txt file
        data = request.args.get('file')
        text_file = open("Output.txt", "w")
        text_file.write(data)
        text_file.close()

        # Open file containing base64 string
        filepath = "Output.txt"
        fi0 = open(filepath, "r")
        encoded_img = fi0.read()

        # Convert base64 to png
        image_64_decode = base64.b64decode(encoded_img)
        image_result = open('decode.png', 'wb')  # create a writable image and write the decoding result
        image_result.write(image_64_decode)

        out = os.popen('python3 -m scripts.label_image --graph=tf_files/retrained_graph.pb --image=decode.png').read()

        # return highest probable result
        sign, score = handle_output(out)
        return 'Sign: ' + sign + ', probability: ' + str(score)

    elif request.method == 'POST':
        return '200 POST request OK'

    else:
        return "Error 405 Method Not Allowed"


if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=80)

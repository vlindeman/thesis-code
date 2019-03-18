import os
from flask import Flask, flash, request, redirect, url_for
from werkzeug.utils import secure_filename


UPLOAD_FOLDER = '/upload_folder/'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/", methods=['GET', 'POST'])
def main(): 
    if request.method == 'GET':

        print(request.args.get('name'))
        if 'file' not in request.files:
            return "Welcome to my Flask page"


    elif request.method == 'POST':
        if 'file' not in request.files:
            #flash('No file part')
            #return redirect(request.url)
            return 'POST request received, No file!'

        file = request.files['file']
        # if user does not select file, browser also
        # submit a empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('uploaded_file',
                                    filename=filename))

        return 'POST request received!'


    else:
        return "Error 405 Method Not Allowed"

if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=80)



#!/usr/bin/env python3

import os
import tensorflow as tf
from flask import Flask, flash, request, redirect, url_for
from werkzeug.utils import secure_filename

from google.cloud import storage
import werkzeug

UPLOAD_FOLDER = '/tmp'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

model = tf.keras.models.load_model('./1.h5')
print(model.summary())

storage_client = storage.Client()
bucket = storage_client.get_bucket(os.environ['GCLOUD_BUCKET'])

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            blob = bucket.blob(image_name)
            blob.upload()
        return 200, "OK"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=6969)
#!/usr/bin/env python3

import os
import tensorflow as tf
from tensorflow import keras
from flask import Flask
from flask_restful import Resource, Api
from google.cloud import storage

app = Flask(__name__)
api = Api(app)

model = tf.keras.models.load_model('./1.h5')
print(model.summary())

storage_client = storage.Client()
bucket = storage_client.get_bucket(os.environ['GCLOUD_BUCKET'])

class CatOrDog(Resource):
    def Post(self, image_name):
        blob = bucket.blob(image_name)
        blob.upload

api.add_resource(CatOrDog, '/<string:image_name>')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9999)
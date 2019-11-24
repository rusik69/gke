import os

import tensorflow as tf
from tensorflow import keras
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

model = tf.saved_model.load("model/1/")
print(list(model.signatures.keys()))

class CatOrDog(Resource):
    def Post(self):
        pass

api.add_resource(CatOrDog, '/catordog')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=6969)
#!/usr/bin/env python3

import tensorflow as tf

if __name__ == "__main__":
  print(tf.version.VERSION)
  model = tf.saved_model.load("./model/1/")
  
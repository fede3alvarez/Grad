import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Build Neural Network
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Activation, Dense

# Train Neural Network
from sklearn.utils import shuffle
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.optimizers import SGD
from tensorflow.keras.metrics import categorical_crossentropy

def func(step=0.0001, low=-0*np.pi, high=2*np.pi, period=12):
    """
    This function plots the following graph:
        g(x) = 100 + cos(pi*x/12)
    and returns 2 numpy arrays with x and corresponding y values
    """
    x = np.arange(low, high, step)
    y = 100 + np.cos(x * np.pi / 12)
    return x, y

x, y = func()

scaler = MinMaxScaler(feature_range=(0,0.99))
x, y= shuffle(x, y)
x_train = scaler.fit_transform(x.reshape(-1,1))
y_train = scaler.fit_transform(y.reshape(-1,1))

#x_train = tf.keras.utils.normalize(x)
#y_train = tf.keras.utils.normalize(y)

# Keras Tutorial
model = Sequential([
    Dense(units=16, input_shape=(1,), activation='sigmoid'),
    Dense(units=16, activation='sigmoid'),
    Dense(units=16, activation='sigmoid'),
    Dense(units=1, activation='sigmoid')
])

model.summary()

model.compile(optimizer=SGD(learning_rate=1), loss='mean_squared_error', metrics=['accuracy'])

# Training the model
model.fit(x=x_train, y=y_train, batch_size=100, epochs=30, verbose=2)

"""
# Feedforward Neural Network
model = tf.keras.models.Sequential()
# Unsure if this is needed, as this is not multidimensional
# Input layertutorial
model.add(tf.keras.layers.Flatten())
# Add hidden layers
model.add(tf.keras.layers.Dense(4, activation=tf.nn.relu))
model.add(tf.keras.layers.Dense(4, activation=tf.nn.relu))
model.add(tf.keras.layers.Dense(10, activation=tf.nn.softmax))

model.compile(optimizer='adam',loss='sparse_categorical_crossentropy',metrics='accuracy')

model.fit(x,y, epochs=3)

print("x: ", x) 
print("y: ", y) 

plt.plot(x,y)
plt.title('g(x) = 100 + cos(pi*x/12)')
plt.xlabel('x')
plt.ylabel('y')
plt.show()
"""
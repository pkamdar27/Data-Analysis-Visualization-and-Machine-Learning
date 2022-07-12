# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import numpy as np
import pickle


# Loading the saved model
load_model = pickle.load(open('C:/Users/pkamd/Desktop/Priyanka/Data/End - End Project/For GitHub/Data Analysis and Machine Learning/Diabetes/diabetes_dataset_trained_model.sav',"rb"))

input_data = (4,110,92,0,0,37.6,0.191,30)

input_data_as_numpy = np.asarray(input_data)
input_data_reshaped = input_data_as_numpy.reshape(1,-1)

predictions = load_model.predict(input_data_reshaped)
print(predictions)

if (predictions[0] == 0):
    print("The person is not Diabetic")
else:
    print("The person is Diabetic")
import numpy as np
import pandas as pd
import seaborn as sb
import matplotlib.pyplot as plt
import sklearn
import csv

from sklearn import svm
from sklearn.metrics import confusion_matrix, recall_score, precision_score, accuracy_score
from sklearn.utils import shuffle
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report
from datetime import datetime


print("Started LR")
data=pd.read_csv(("./MyData.csv"))
label=pd.read_csv("./MyLabel.csv")


data.head()
label.head()

data_arr=np.asarray(data)
label_arr=np.asarray(label)

data_reshape= np.reshape(data_arr,(len(data_arr),len(data_arr[0])))
label_reshape=np.reshape(label_arr,(len(label_arr),))



X, Y = shuffle(data_reshape, label_reshape, random_state=88)

X_pre_train_arr=np.asarray(X)
Y_pre_train_arr=np.asarray(Y)

new_X_pre_train= np.reshape(X_pre_train_arr,(len(X_pre_train_arr),len(data_arr[0])))
new_Y_pre_train=np.reshape(Y_pre_train_arr,(len(X_pre_train_arr),))

X_pre_train,Y_pre_train=shuffle(new_X_pre_train,new_Y_pre_train,random_state=88)
X_train,X_test1,Y_train,Y_test=train_test_split(X_pre_train,Y_pre_train,test_size=0.20,random_state=48)


svclassifier = svm.SVC(kernel='rbf', C=5, gamma=2**-5)

svclassifier.fit(X_train, Y_train)

Y_pred = svclassifier.predict(X_test1)

conf_mat = confusion_matrix(Y_test, Y_pred)
print("Confusion Matrix is: \n{}\n\n".format(conf_mat))


print(classification_report(Y_test, Y_pred))


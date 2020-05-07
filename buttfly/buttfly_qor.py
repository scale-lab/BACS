#!/usr/bin/python
import os
import math
import numpy
import sys

def dataCompare(Groundtruth, Modified):
    if (os.path.exists(Modified)):
        data = open(Modified)
        Modified_data = data.readlines()
    if (os.path.exists(Groundtruth)):
        data = open(Groundtruth)
        Ground_truth = data.readlines()
    L = min (len(Modified_data), len(Ground_truth))
    temp = 0
    for i in range(0, L):
        x=Modified_data[i].split()
        y=Ground_truth[i].split()
        temp = temp + abs(float(x[0])-float(y[0]))/float(y[0])+ abs(float(x[1])-float(y[1]))/float(y[1])
    print('MAE %', 100*temp/(2*L))
    return temp/L

dataCompare(sys.argv[1], sys.argv[2])

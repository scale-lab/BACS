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
    maxv=2**16-1
    for i in range(0, L):
        temp= temp+abs(float(Modified_data[i]) - float(Ground_truth[i]))/maxv
    print('MAE % ', 100*temp/L)
    return temp/L

dataCompare(sys.argv[1], sys.argv[2])

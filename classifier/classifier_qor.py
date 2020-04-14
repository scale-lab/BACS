#!/usr/bin/python
import os
import math
import numpy
import sys

def QoS (Modified_data, Ground_truth):
    status = 'success'
    org_error = [0] * len(Ground_truth)
    mod_error = [0] * len(Modified_data)
    rel_error = [0] * len(Modified_data)
    for i in range (1, len(Modified_data)+1):
        L = min (len(Modified_data[i-1]), len(Ground_truth[i-1]))
    # Accuracy of original svm.v
    # org_error = 0
    for n in range (1, len(Ground_truth)+1):
        temp=0
        for i in range(1, L+1):
            temp = temp + abs(float(Modified_data[n-1][i-1]) - float(Ground_truth[n-1][i-1]))
        org_error[n-1]= temp
        print ('Classification Inccuracy:' , temp/10, '%')
    return status

def dataCompare(Groundtruth, Modified):
    NumtestCases = 1
    Modified_data = [0] * NumtestCases
    Ground_truth = [0] * NumtestCases
    i=1
    if (os.path.exists(Modified)):
        data = open(Modified)
        temp = []
        temp = data.readlines()
        Modified_data[i-1] = temp
    if (os.path.exists(Groundtruth)):
        data = open(Groundtruth)
        temp = []
        temp = data.readlines()
        Ground_truth[i-1] = temp
    status = QoS (Modified_data, Ground_truth)


dataCompare(sys.argv[1], sys.argv[2])

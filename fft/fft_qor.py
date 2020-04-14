#!/usr/bin/python
import string
import os
import numpy
import math
import sys

def FFT_QOR(out_txt, sec_text):
	thresh = 10
	Numtestcases=1
	fft_mse = numpy.zeros((Numtestcases,1))
	for k in range (1, Numtestcases +1):
		if(os.path.exists(out_txt)):
			y_fft_orig = open(out_txt).readlines()
		else:
			print( 'Cannot locate simulation output files for original circuit!\n')
			print( 'fail')
			return
		y_fft_Re_org = [0] * len(y_fft_orig)
		y_fft_Im_org = [0] * len(y_fft_orig)
		for i in range(len(y_fft_orig)):
			element = y_fft_orig[i]
			m=int(element[0:4],16)
			y_fft_Re_org[i] = ((m+0x8000)&0xFFFF) - 0x8000
			m=int(element[4:8],16)
			y_fft_Im_org[i] = ((m+0x8000)&0xFFFF) - 0x8000
			#print "%d %d %d" % (i, y_fft_Re_org[i], y_fft_Im_org[i])
		for m in range(1,len(y_fft_Re_org)+1):
			if (y_fft_Re_org[m-1]=='NaN' or y_fft_Im_org[m-1]=='NaN'):
				print ("Not a Number")
				print( "fail")
				return
		#y_ifft_org= [sum(x) for x in zip(y_fft_Re_org , [1j* x for x in y_fft_Im_org])]

		out_txt = sec_text
		if (os.path.exists(out_txt)):
			y_fft = open(out_txt).readlines()
		else:
			print( "Cannot locate simulation output files for modified circuit!\n")
			print( "fail")
			return
		y_fft_Re = [0] * len(y_fft)
		y_fft_Im = [0] * len(y_fft)
		for n in range(len(y_fft)):
			element = y_fft[n]
			#print "%d" % n
			x = int(element[0:4], 16)
			y_fft_Re[n] = ((x+0x8000)&0xFFFF) - 0x8000
			x = int(element[4:8], 16)
			y_fft_Im[n] = ((x+0x8000)&0xFFFF) - 0x8000
		for m in range(1,len(y_fft_Re)+1):
			if (y_fft_Re[m-1]=='NaN' or y_fft_Im[m-1]=='NaN'):
				print ("Not a Number")
				print ("fail")
				return
		#y_ifft_mod= [sum(x) for x in zip(y_fft_Re , [1j* x for x in y_fft_Im])]
        # sum the real and the immagonary parts:
        #data_1 = [sum(x) for x in zip(y_fft_Re , [1j* h for h in y_fft_Im])]
        # take the inverse fft:
        #y_ifft_mod = numpy.fft.ifft(data_1)
        # subtract original from modifies:
		amplitude_mod = [math.sqrt(math.pow(i,2) + math.pow(j,2)) for i, j in zip(y_fft_Re, y_fft_Im)]
		amplitude_org = [math.sqrt(math.pow(i,2) + math.pow(j,2)) for i, j in zip(y_fft_Re_org, y_fft_Im_org)]
		#print amplitude_org
		#print amplitude_mod
		data_2 = [i - j for i, j in zip(amplitude_mod, amplitude_org)]
		#print data_2
        # take the real part:
		#data_3 = [g.real for g in data_2]
        # square it:
		diff_square= [x*x for x in data_2]
		#print diff_square
        # take the square of real part of y_ifft_orig:
		#data_4 = [x*x for x in [l.real for l in y_ifft_org]]
		data_4 = [x*x for x in amplitude_org]
		fft_mse[k-1] = (numpy.mean(diff_square)/numpy.mean(data_4))*100
		print('MSE %f'% fft_mse[k-1])
		if (fft_mse[k-1] >= thresh):
			print ("fail")
			return
		fft_accuracy = 100 - fft_mse
		return fft_accuracy

qor=FFT_QOR(sys.argv[1], sys.argv[2])
#print(qor)

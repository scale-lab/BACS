import numpy as np
import sys

def MAE(original_path, approximate_path):
    with open(original_path, 'r') as fo:
        org_line_list = fo.readlines()
    with open(approximate_path, 'r') as fa:
        app_line_list = fa.readlines()
    
    org = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in org_line_list]
    app = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in app_line_list]

    if len(org_line_list) != len(app_line_list):
        print('ERROR! sizes of input files are not equal! Aborting...')
        return -1

    num_vec = len(org)
    num_pos = len(org[0])

    maxnum = 2 ** num_pos - 1

    err = []

    for i in range(num_vec):
        orgnum = int(''.join(org[i]), 2)
        appnum = int(''.join(app[i]), 2)
        err.append( np.abs(orgnum - appnum) )

    return np.mean(err) / maxnum

res=MAE(sys.argv[1], sys.argv[2])
print('MAE (%)', 100*res)

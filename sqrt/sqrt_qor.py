import numpy as np
import sys

def HD(original_path, approximate_path):
    with open(original_path, 'r') as fo:
        org_line_list = fo.readlines()
    with open(approximate_path, 'r') as fa:
        app_line_list = fa.readlines()

    org = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in org_line_list]
    app = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in app_line_list]

    if len(org_line_list) != len(app_line_list):
        print('ERROR! sizes of input files are not equal! Aborting...')
        return -1
    org = np.array(org)
    app = np.array(app)
    total = org.size
    HD = np.sum(org != app)
    return HD/total

hd=HD(sys.argv[1], sys.argv[2])
print('HD ', hd)

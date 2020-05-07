import numpy as np
import sys

def HD(original_path, approximate_path):
    with open(original_path, 'r') as fo:
        org = fo.readlines()
    with open(approximate_path, 'r') as fa:
        app = fa.readlines()

    org = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in org]
    app = [list(filter(lambda a: a != ' ', list(i[:-1]))) for i in app]

    if len(org) != len(app):
        print('ERROR! sizes of input files are not equal! Aborting...')
        return -1
    org = np.array(org)
    app = np.array(app)
    total = org.size
    HD = np.sum(org != app)
    return HD/total

hd=HD(sys.argv[1], sys.argv[2])
print('HD % ',100*hd)

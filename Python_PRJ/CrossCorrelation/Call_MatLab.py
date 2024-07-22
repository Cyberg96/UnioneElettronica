#Enrico Ubaldino
#Python write in terminal and call Matlab

import os
import subprocess
import numpy as np
import matplotlib.pyplot as plt
import random


def filedat2datalist(filename: str, base) -> list:
    data = []
    with open(filename, 'r') as f:
        while True:
            line = f.readline()
            if not line:
                break
            if line:
                line_val = int(line, base)
                data.append(line_val)
    return data



list1 = np.random.randn(100)
list1 = [random.randint(1,1000) for _ in range(100)]
shift_amount = 20
list2 = np.concatenate((np.zeros(shift_amount), list1[:-shift_amount]))

# Convert python list ot array matlab
list1_str = "["+" ".join(map(str,list1))+"]"
list2_str = "["+" ".join(map(str,list2))+"]"


# Change directory 
os.chdir(r"C:\Users\enric\Desktop\UnioneElettronica\Python_PRJ\CrossCorrelation")
plt_en = 0
command = f'matlab -batch "CrossCorrelation_func({list1_str},{list2_str},{plt_en}); exit; '
commandDB = f' matlab -r "dbstop in CrossCorrelation_func at 5; CrossCorrelation_func({list1_str},{list2_str},{plt_en});'

# Call from shell
os.system(command)
#os.system(commandDB)


# Read output matlab function
aligned_ref = filedat2datalist("aligned_ref.dat",10)
aligned_meas = filedat2datalist("aligned_meas.dat",10)

success = (aligned_meas == aligned_ref)

print(f'Compare tv vs meas : {success}')

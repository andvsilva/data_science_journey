###########################################################
### step  2 - feature engineering
# 
# Add description for this code.
# Author: Your name here / Thu Apr 22 11:14:38 2021
# Contact me: name@email.com
###########################################################

# libraries for this project
import json
import pandas as pd
import numpy as np
from IPython.display import HTML
import matplotlib.pyplot as plt
import seaborn as sns
import os.path
import sys
import gc
import feather
from icecream import ic
from sys import getsizeof
import time
from datetime import datetime
import matplotlib.pyplot as pltcode 
import matplotlib.dates as mdates
from matplotlib.ticker import MaxNLocator
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from datetime import datetime

# Pandas has a high consume of memory RAM usage
# release memory RAM
def release_memory(df):   
    del df
    gc.collect() 
    df = pd.DataFrame() # point to NULL
    print('memory RAM released.')

# Get start time 
start_time = time.time()

# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)

print("Loading dataset - cleaned to feature select/engineering...")

# loading data feather format
df_cleaned = pd.read_feather('data/dataset_preprocessed.ftr')
df_cleaned.head()

# dataframe shape
print(df_cleaned.shape)

# column names
print(df_cleaned.columns)

# types for each feature
print(df_cleaned.dtypes)

# print the feature 'ocean_proximity'
print(df_cleaned.ocean_proximity)

# get statistic - category feature
print(df_cleaned['ocean_proximity'].value_counts(normalize=True).map('{:.2%}'.format))

# convert object type to category.
df_cleaned['ocean_proximity'] = df_cleaned['ocean_proximity'].astype('category')

print(df_cleaned.dtypes)

print("saving the file format feather...")
# this is important to do before save in feather format.
df_cleaned = df_cleaned.reset_index(drop=True) 
df_cleaned.to_feather('data/dataset_featureselect.ftr')

# time of execution in minutes
time_exec_min = round( (time.time() - start_time)/60, 4)

print(f'time of execution (preprocessing): {time_exec_min} minutes')
print("the preprocessing is done.")
print("The next step is to do the modeling.")

# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)

print("All Done. :)")
###########################################################
### step  1 - loading dataset, preprocessing dataset
# 
# Add description for this code.
# Author: Your name here / Thu Apr 22 11:14:38 2021
# Contact me: name@email.com
###########################################################

import pandas as pd
import sys
import itertools
from collections import Counter
import numpy as np
import gc # Garbage Collector interface
import feather
import time
from datetime import datetime

## https://towardsdatascience.com/26-datasets-for-your-data-science-projects-658601590a4c

# Regression Datasets
# California Housing Prices — almost the same as no. 1.

## https://github.com/andvsilva/dataset 

# source dataset: https://www.kaggle.com/camnugent/california-housing-prices?select=housing.csv

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

# dataframe - df
# read csv file, the columns are separated (sep) by ','
#df = pd.read_csv('data/cumulative.csv', sep=",")
df = pd.read_csv('data/housing.csv')
print(df)

print(f'Number of rows.....................: {df.shape[0]}')
print(f'Number of columns..................: {df.shape[1]}')

# information dataframe:
print(df.info())

# get statistic - feature:
print(df["ocean_proximity"].value_counts())

# describe dataframe
print(df.describe())

# checking how much memory is used by the DataFrame
print(df.info(verbose=False, memory_usage="deep"))

# count NaN found in the dataset
print(df.isna().sum())

print(df.shape)
df = df.dropna()

print(df)

print(f'Number of rows.....................: {df.shape[0]}')
print(f'Number of columns..................: {df.shape[1]}')

print("saving the file format feather...")

# this is important to do before save in feather format.
df = df.reset_index(drop=True) # reset index pandas before save feather format
df.to_feather('data/dataset_preprocessed.ftr') # save to feather format

# time of execution in minutes
time_exec_min = round( (time.time() - start_time)/60, 4)

print(f'time of execution (preprocessing): {time_exec_min} minutes')
print("the preprocessing is done.")
print("The next step is to do the feature engineering.")
# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)

print("All Done. :)")
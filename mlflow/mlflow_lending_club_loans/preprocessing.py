###########################################################
### step  1 - loading dataset, preprocessing dataset
# 
# Add description for this code.
# Author: Your name here / Thu Apr 22 11:14:38 2021
# Contact me: name@email.com
###########################################################

import pandas                   as pd
import sys
import itertools
from collections               import Counter
import numpy                   as np
import gc # Garbage Collector interface
import feather
import time
from datetime                  import datetime
import matplotlib.pyplot       as plt
import seaborn                 as sns
from sklearn.feature_selection import mutual_info_classif
import plotly.express          as ex
from matplotlib                import pyplot

from sklearn.preprocessing     import OneHotEncoder
from sklearn.preprocessing     import LabelEncoder

#from pandas_profiling          import ProfileReport

# Normality tests
from scipy.stats import normaltest

pd.set_option('max_columns', 120)
pd.set_option('max_colwidth', 5000)

plt.rcParams['figure.figsize'] = (20, 20)

##### >>> https://towardsdatascience.com/a-straightforward-guide-to-cleaning-and-preparing-data-in-python-8c82f209ae33
# source dataset: https://www.dataquest.io/blog/machine-learning-preparing-data/

# data cleaning - sources
# https://medium.com/sciforce/data-cleaning-and-preprocessing-for-beginners-25748ee00743
# https://medium.com/bitgrit-data-science-publication/data-cleaning-with-python-f6bc3da64e45
# https://towardsdatascience.com/the-ultimate-guide-to-data-cleaning-3969843991d4
# https://towardsdatascience.com/data-cleaning-and-feature-engineering-the-underestimated-parts-of-machine-learning-10681dae4cf7

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

print("preprocessing...")
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)


# dataframe - df
# read csv file, the columns are separated (sep) by ','
df = pd.read_csv('../../data/lending_club_loans_2007_2011.csv', skiprows=1, low_memory=False)

half_count = len(df) / 2
df = df.dropna(thresh=half_count,axis=1) # Drop any column with more than 50% missing values
df = df.drop(['url','desc', 'initial_list_status','pymnt_plan'],axis=1) # These columns are not useful for our purposes

# After analyzing the columns and considering the model we’re 
# trying to build, we can conclude that the following features 
# can be removed:

drop_list = ['id','member_id','funded_amnt','funded_amnt_inv',
             'int_rate','sub_grade','emp_title','issue_d', 'zip_code',
             'out_prncp','out_prncp_inv', 'total_pymnt','total_pymnt_inv',
             'total_rec_prncp','total_rec_int',
             'total_rec_late_fee','recoveries',
             'collection_recovery_fee', 'last_pymnt_d',
             'last_pymnt_amnt', 'policy_code'
            ]
            
df = df.drop(drop_list,axis=1)

print("Shape:")
print(f'Number of rows.....................: {df.shape[0]}')
print(f'Number of columns..................: {df.shape[1]}')

# % of rows missing in each column
list_columns_nan = list()

print('% of rows missing in each column')
for column in df.columns:
    percentage = df[column].isnull().mean()
    if(percentage != 0):
        print(f'{column}: {round(percentage*100, 2)}%')
        list_columns_nan.append(column)


# count NaN found in the dataset
df.isna().sum()

# heatmap - give a big picture of the missing values on the dataset.
plt.title('Missing Values Per Feature')
nans = df.isna().sum().sort_values(ascending=False).to_frame() # get NaN
sns.heatmap(nans,annot=True,fmt='d',cmap='vlag') # seaborn
plt.savefig(f'pictures/missing_values_per_feature.png')
plt.savefig(f'pictures/missing_values_per_feature.pdf')

#df = df.dropna() # drop rows with NaN's
df.shape

df[list_columns_nan].head()

# remove a special character on dataframe
df['revol_util'] = df['revol_util'].str.replace('%', '')
#df['int_rate'] = df['int_rate'].str.replace('%', '')

# Convert object to float
df['revol_util'] = df['revol_util'].astype(float)

# convert obejcto category
list_cat = ['last_credit_pull_d']

for ilist in list_cat:
    df[f'{ilist}'] = df[f'{ilist}'].astype('category')


df[list_columns_nan].dtypes

df_target = df['loan_status'].value_counts(normalize=True).map('{:.2%}'.format)
df_target = dict(df_target)
df_target

df.shape

list_drop_target = ['Late (31-120 days)',
                    'Current',
                    'Late (16-30 days)',
                    'In Grace Period',
                    'Default',
                    'Does not meet the credit policy. Status:Fully Paid',
                    'Does not meet the credit policy. Status:Charged Off'
                   ]

for drop_target in list_drop_target:
    index_drop_target = df[ (df['loan_status'] == f'{drop_target}')].index
    df.drop(index_drop_target, inplace = True)

df.shape

df['loan_status'].value_counts(normalize=True).map('{:.2%}'.format)


df_tar = pd.DataFrame([df_target])
df_tar

list_col = list(df_tar.columns)

for col in list_col:
    df_tar[f'{col}'] = df_tar[f'{col}'].str.replace('%', '')

df_tar[df_tar.select_dtypes(['object']).columns] = df_tar.select_dtypes(['object']).apply(lambda x: x.astype('float64'))
df_tar.dtypes

fig, axs = plt.subplots(1,2,figsize=(14,7))

sns.countplot(x='loan_status',data=df,ax=axs[0])
axs[0].set_title("Frequency of each Loan Status")
df['loan_status'].value_counts().plot(x=None,y=None, kind='pie', ax=axs[1],autopct='%1.2f%%')
axs[1].set_title("Percentage of each Loan status")
plt.savefig('pictures/target_stat.png')
plt.show()

print(df['fico_range_low'].unique())
print(df['fico_range_high'].unique())

df[df.select_dtypes(['object']).columns] = df.select_dtypes(['object']).apply(lambda x: x.astype('category'))

df.dtypes

# instantiate labelencoder object
le = LabelEncoder()
categorical_cols = list(df.select_dtypes(['category']))

# apply le on categorical feature columns
df[categorical_cols] = df[categorical_cols].apply(lambda col: le.fit_transform(col))

print(categorical_cols)


fico_columns = ['fico_range_high','fico_range_low']

print(df.shape[0])

df.dropna(subset=fico_columns,inplace=True)
print(df.shape[0])

plt.rcParams['figure.figsize'] = (12, 12)

df[fico_columns].plot.hist(alpha=0.5,bins=20)
plt.savefig('pictures/fico_range_stat.png')

df['fico_average'] = (df['fico_range_high'] + df['fico_range_low']) / 2
cols = ['fico_range_low','fico_range_high','fico_average']

print('Drop columns fico ranges ')
drop_cols = ['fico_range_low','fico_range_high','last_fico_range_low', 'last_fico_range_high']
df = df.drop(drop_cols, axis=1)
print(df.shape)

# get list for only dtypes 'int64 and 'float64'
list_columns = list(df.columns)

for column in list_columns:
    mean = df[f'{column}'].mean()
    std = df[f'{column}'].std()
    
    if(mean == 0 and std == 0):
        # drop columns with zero for mean and standard devitation
        df = df.drop(columns=[f'{column}'])
        print(f"{column} - mean: {mean} std: {std}")


df = df.dropna()
print(df.info())

print(f'Number of rows.....................: {df.shape[0]}')
print(f'Number of columns..................: {df.shape[1]}')

# count NaN found in the dataset
print(df.isna().sum())

print("saving the file feather-format...")

# this is important to do before save in feather format.
df = df.reset_index(drop=True) # reset index pandas before save feather format
df.to_feather('../../data/dataset_cleaning_loan.ftr') # save to feather format

release_memory(df)

# time of execution in minutes
time_exec_min = round( (time.time() - start_time)/60, 4)

print(f'time of execution (preprocessing/cleaning): {time_exec_min} minutes')
print("the preprocessing is done.")
print("The next step is to do the feature engineering.")
# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)

print("All Done. :)")
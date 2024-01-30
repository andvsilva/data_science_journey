import random
import pandas as pd
import snoop
import feather
import time
import gc
import sys
import feather
import os
from faker import Faker
from varname import nameof
from icecream import ic
from tqdm import tqdm

# Pandas has a high consume of memory RAM usage
# release memory RAM
def release_memory(df):   
    del df
    gc.collect() 
    df = pd.DataFrame() # point to NULL
    print('memory RAM released.')

# Get start time 
start_time = time.time()

# faker object
fake = Faker()

number_of_clients = int(sys.argv[1])

#@snoop
def make_database():
    # info employer
    satisfaction = round(random.uniform(0, 1), 2)
    evaluation = round(random.uniform(0, 1), 2)
    projectCount = random.randint(1, 7)
    averageMonthlyHours = random.randint(96, 310)
    yearsAtCompany = random.randint(2, 10)
    workAccident = random.randint(0, 1)
    turnover = random.randint(0, 1)
    promotion = random.randint(0, 1)
    dept = random.randint(0, 9)
    salary = random.randint(0, 2)
    
    name_cols = []
    name_cols.append(nameof(satisfaction))
    name_cols.append(nameof(evaluation))
    name_cols.append(nameof(projectCount))
    name_cols.append(nameof(averageMonthlyHours))
    name_cols.append(nameof(yearsAtCompany))
    name_cols.append(nameof(workAccident))
    name_cols.append(nameof(turnover))
    name_cols.append(nameof(promotion))
    name_cols.append(nameof(dept))
    name_cols.append(nameof(salary))
    
    # fake database
    database = {f'satisfaction': satisfaction, 
                f'evaluation': evaluation,
                f'projectCount': projectCount,
                f'averageMonthlyHours': averageMonthlyHours,
                f'yearsAtCompany': yearsAtCompany,
                f'workAccident': workAccident,
                f'turnover': turnover,
                f'promotion': promotion,
                f'dept': dept,
                f'salary': salary
               }
    
    ## transaction
    # data - sell
    #print(f'id ....................: {id}')
    #print(f'client name............: {client_name}')
    #print(f'date...................: {date}')
    #print(f'date register..........: {date_register}')
    #print(f'value..................: {value}')

    
    return name_cols, database

#@snoop
def generate_fakedata(nrows):    
    
    irow = 1
    name_cols, database = make_database()
    df = pd.DataFrame(columns=name_cols)
    
    with tqdm(total=nrows, desc="Waiting...", bar_format="{l_bar}{bar} [ time left: {remaining} ]") as pbar:
        while(irow <= nrows):
            pbar.update(1)
            time.sleep(0.00468)
            name_cols, database = make_database()
            df_database = pd.DataFrame([database])
            df = pd.concat([df if not df.empty else None, df_database ], ignore_index=True)
            irow += 1

    return df

print("----------------------------- DATABASE ----------------------------") 
df = generate_fakedata(nrows=number_of_clients)
# display the database
print(df)

print("saving the file format feather...")
# this is important to do before save in feather format.
df = df.reset_index(drop=True) 
#df.to_feather('fakeDatabase.ftr')
df.to_csv('turnover.csv')
release_memory(df)

# time of execution in minutes
time_exec_min = round( (time.time() - start_time)/60, 4)

print(f'time of execution: {time_exec_min} minutes')
os.system('date')
print(f"All Done. :)")
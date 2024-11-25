####################################################################################
## This script is the workflow of the project

### Building...
### step  0 - Installing the libraries via pip3

# Author: Your name here, contact me : name@email.com

#####################################################################################

from platform import python_version
import sys
import os
import time
from tqdm import tqdm

start_time = time.time()

# Get the YouTube video URL from command-line arguments
youtube_url = sys.argv[1]

# script master to run ALL the steps of the project. 
def main():

    # checking the python version:
    if sys.version_info<(3,6,0):
        py_version = python_version()
        print(f'The python version installed in your computer: {py_version}')
        sys.stderr.write("You need python 3.6 or later to run this script\n")
        sys.exit()
        
    else:
        py_version = python_version()
        print(f'python version: {py_version}')
        print('Successfully, go ahead to run the script.')
        
    # step 0    
    #os.system('pip3 install -r requirements.txt')

    # step 1
    os.system(F'python3 downloadytaudio.py {youtube_url}') # > logs/info-preprocess.dat
    
    # step 2
    os.system('python3 audiototext.py') # > logs/feature-eng.dat

    time_exec_min = round( (time.time() - start_time)/60, 4)
    
    print(f'time of execution (total pipeline): {time_exec_min} minutes')
    print('Done! please, check the results. :)')

if __name__ == "__main__":
    main()
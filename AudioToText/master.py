from platform import python_version
import sys
import os
import time

# Define the path to your text file
file_path = 'yt_links/links.txt'

# script master to run ALL the steps of the project. 
def main():

    # Open the file and read each line
    with open(file_path, 'r') as file:
        youtube_links = file.readlines()

    # Strip whitespace from each line (e.g., newline characters) and print the links
    youtube_links = [link.strip() for link in youtube_links]

    linknumber = 1

    for youtube_url in youtube_links:
        start_time = time.time()
        print(f'>>> youtube_url: {youtube_url}')

        # step 1
        os.system(f'python3 downloadytaudio.py {youtube_url} {linknumber}') # > logs/info-preprocess.dat

        # step 2
        os.system('python3 audiototext.py') # > logs/feature-eng.dat

        time_exec_min = round( (time.time() - start_time)/60, 4)
        
        print(f'time of execution (total pipeline): {time_exec_min} minutes')
        print('Done! please, check the results. :)')

        linknumber += 1

if __name__ == "__main__":
    main()
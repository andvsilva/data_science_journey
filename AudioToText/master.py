from platform import python_version
import sys
import time
import subprocess

# Define the path to your text file
file_path = 'yt_links/links.txt'

# script master to run ALL the steps of the project. 
def main():

    # Open the file and read each line
    with open(file_path, 'r') as file:
        youtube_links = file.readlines()

    # Strip whitespace from each line (e.g., newline characters) and print the links
    youtube_links = [link.strip() for link in youtube_links]

    for youtube_url in youtube_links:
        start_time = time.time()
        print(f'>>> youtube_url: {youtube_url}')

        # step 1
        subprocess.run(['python3', 'downloadytaudio.py', youtube_url])

        # Step 2
        subprocess.run(['python3', 'audiototext.py'])

        time_exec_min = round( (time.time() - start_time)/60, 4)
        
        print(f'time of execution (total pipeline): {time_exec_min} minutes')
        print('Done! please, check the results. :)')

if __name__ == "__main__":
    main()
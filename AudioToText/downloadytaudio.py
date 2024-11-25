import sys
import pytubefix
import ffmpeg
import subprocess
import re
import os
import time
from tqdm import tqdm
import subprocess

# Get the duration of the audio file in seconds
def get_duration(input_file):
    result = subprocess.run(
        ['ffprobe', '-v', 'error', '-show_entries', 'format=duration', '-of', 'default=noprint_wrappers=1:nokey=1', input_file],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT
    )
    return float(result.stdout)

# Get the YouTube video URL from command-line arguments
youtube_url = sys.argv[1]
linknumber = sys.argv[2]

# Specify the output file name for the audio
filename = f"audios/audio_{linknumber}.wav"

# Create a YouTube object and fetch the stream URL
print('Downloading audio from youtube...')
yt = pytubefix.YouTube(youtube_url)

print('Fetching audio stream...')
stream = yt.streams[0].url  # Get the first available stream (usually audio)

print('Use ffmpeg to convert the audio stream to a .wav file...')
# Use ffmpeg to convert the audio stream to a .wav file
ffmpeg.input(stream).output(filename, format='wav', loglevel="error").run()

print(f"Audio downloaded and saved as {filename}")
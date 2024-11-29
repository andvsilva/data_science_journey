import sys
import pytubefix
import ffmpeg
import time
from datetime import datetime

# Get the YouTube video URL from command-line arguments
youtube_url = sys.argv[1]

# Specify the output file name for the audio
filename = f"audios/"
timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
filename += f"audio_{timestamp}.wav"

time.sleep(2)

# Create a YouTube object and fetch the stream URL
print('Downloading audio from youtube...')
yt = pytubefix.YouTube(youtube_url)

print('Fetching audio stream...')
stream = yt.streams[0].url  # Get the first available stream (usually audio)

print('Use ffmpeg to convert the audio stream to a .wav file...')
# Use ffmpeg to convert the audio stream to a .wav file
ffmpeg.input(stream).output(filename, format='wav', loglevel="error").run()

text_file = open(f"filename_audio.txt", "w")
text_file.write(f"{filename}")
text_file.close()

print(f"Audio downloaded and saved as {filename}")
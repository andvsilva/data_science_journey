import streamlit as st
import pytubefix
import ffmpeg
from datetime import datetime
import os

# Function to download and convert YouTube audio
def download_audio(youtube_url):
    try:
        # Specify the output file name for the audio
        filename = f"audios/"
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        filename += f"audio_{timestamp}.wav"

        # Ensure the directory exists
        os.makedirs("audios", exist_ok=True)

        # Create a YouTube object and fetch the stream URL
        yt = pytubefix.YouTube(youtube_url)

        # Fetch the first available audio stream
        stream = yt.streams[0].url  # Get the first available stream (usually audio)

        # Use ffmpeg to convert the audio stream to a .wav file
        ffmpeg.input(stream).output(filename, format='wav', loglevel="error").run()

        # Return the filename for download
        return filename
    except Exception as e:
        st.error(f"Error: {e}")
        return None

# Streamlit Dashboard UI
st.title("YouTube Audio Downloader")

# Input field for YouTube video URL
youtube_url = st.text_input("Enter YouTube Video URL")

if st.button("Download Audio"):
    if youtube_url:
        st.write("Downloading audio...")
        filename = download_audio(youtube_url)
        
        if filename:
            st.success(f"Audio downloaded and saved as: {filename}")
            # Allow user to download the file
            with open(filename, "rb") as audio_file:
                st.download_button(label="Download Audio", data=audio_file, file_name=os.path.basename(filename), mime="audio/wav")
        else:
            st.error("There was an issue with downloading the audio.")
    else:
        st.error("Please enter a valid YouTube URL.")

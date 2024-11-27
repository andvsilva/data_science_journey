import os
import wave
import time
from tqdm import tqdm
import speech_recognition as sr
from yt_dlp import YoutubeDL
from pydub import AudioSegment
import streamlit as st
from transformers import pipeline
import textwrap

# Ensure directories exist
os.makedirs("downloads", exist_ok=True)
os.makedirs("transcriptions", exist_ok=True)

# Function to download YouTube audio
def download_audio(link):
    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': 'downloads/%(title)s.%(ext)s',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'noplaylist': True
    }
    try:
        with YoutubeDL(ydl_opts) as ydl:
            info_dict = ydl.extract_info(link, download=True)
            file_name = ydl.prepare_filename(info_dict).replace(".webm", ".mp3").replace(".m4a", ".mp3")
            return file_name
    except Exception as e:
        st.error(f"Error downloading audio: {e}")
        return None

# Prepare audio for transcription
def prepare_audio(file_path):
    try:
        audio_file = AudioSegment.from_file(file_path)
        wav_file = file_path.replace(".mp3", ".wav")
        audio_file.export(wav_file, format="wav")
        return wav_file
    except Exception as e:
        st.error(f"Error preparing audio: {e}")
        return None

# Transcribe audio
def transcribe_audio(file_path, language="en-US"):
    recognizer = sr.Recognizer()
    transcribed_text = ""
    try:
        with wave.open(file_path, 'rb') as audio:
            frame_rate = audio.getframerate()
            frames_per_part = frame_rate * 60
            total_frames = audio.getnframes()
            for start in tqdm(range(0, total_frames, frames_per_part), desc="Transcribing"):
                audio.setpos(start)
                with sr.AudioFile(file_path) as source:
                    audio_data = recognizer.record(source, duration=60)
                    try:
                        transcribed_text += recognizer.recognize_google(audio_data, language=language) + "\n"
                    except sr.UnknownValueError:
                        transcribed_text += "[Unintelligible]\n"
        return transcribed_text
    except Exception as e:
        st.error(f"Error transcribing audio: {e}")
        return ""

# AI-based Summarization to extract main points
def extract_main_points_ai(text):
    max_token_length = 1024  # Define the token limit for the model
    summarizer = pipeline("summarization", model="sshleifer/distilbart-cnn-12-6")

    # Check if text is too short for summarization
    if len(text) < 100:
        st.warning("Transcription is too short for summarization.")
        return "Text is too short for meaningful summarization."
    
    try:
        # Split the text into smaller chunks (each less than max_token_length tokens)
        chunked_text = textwrap.wrap(text, max_token_length)

        summarized_chunks = []
        for chunk in chunked_text:
            summary = summarizer(chunk, max_length=200, min_length=50, do_sample=False)
            summarized_chunks.append(summary[0]['summary_text'])
        
        # Combine all the summarized chunks
        final_summary = " ".join(summarized_chunks)
        return final_summary
    except Exception as e:
        st.error(f"Error summarizing text: {e}")
        return None


# Streamlit App
st.title("YouTube Audio Downloader & Transcriber")

# YouTube URL Input
youtube_link = st.text_input("Enter YouTube URL:", "")

# Select Language
language = st.selectbox("Select Transcription Language:", ["en-US", "pt-BR", "es-ES", "fr-FR"])

# Download and Transcribe
if st.button("Download and Transcribe"):
    if youtube_link:
        # Download audio
        with st.spinner("Downloading audio..."):
            audio_path = download_audio(youtube_link)
        if not audio_path:
            st.error("Failed to download audio.")
        else:
            st.success("Audio downloaded successfully!")

        # Prepare audio
        with st.spinner("Preparing audio..."):
            wav_path = prepare_audio(audio_path)
        if not wav_path:
            st.error("Failed to prepare audio.")
        else:
            st.success("Audio prepared for transcription!")

        # Transcribe audio
        with st.spinner("Transcribing audio..."):
            transcription = transcribe_audio(wav_path, language)
            transcription_file = f"transcriptions/{os.path.basename(wav_path).replace('.wav', '.txt')}"
            with open(transcription_file, "w") as f:
                f.write(transcription)
        if not transcription.strip():
            st.error("Transcription failed.")
        else:
            st.success("Transcription completed!")
            st.download_button("Download Transcription", transcription, file_name=os.path.basename(transcription_file))

            # Display AI-based main points
            main_points = extract_main_points_ai(transcription)
            if main_points:
                st.subheader("Main Points of the Transcription (AI Summary):")
                st.write(main_points)

            # Full transcription
            with st.expander("View Full Transcription"):
                st.text_area("Full Transcription", transcription, height=300)
    else:
        st.warning("Please provide a valid YouTube URL.")

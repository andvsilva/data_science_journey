import helper
import sys
import os
import wave
from tqdm import tqdm
from pydub import AudioSegment
import subprocess
import snoop
import time
import re
import speech_recognition as sr

filename_audio = sys.argv[1]

#@snoop
def get_duration(file_path):
    """
    Get the duration of an audio file (WAV or MP3) in seconds.
    """
    _, file_extension = os.path.splitext(file_path)

    if file_extension.lower() == '.wav':
        # WAV file processing
        with wave.open(file_path, 'rb') as audio_file:
            frames = audio_file.getnframes()
            rate = audio_file.getframerate()
            duration = frames / float(rate)
        return duration
    
    elif file_extension.lower() == '.mp3':
        # MP3 file processing (using pydub)
        audio = AudioSegment.from_mp3(file_path)
        duration = len(audio) / 1000.0  # Convert milliseconds to seconds
        return duration
    
    else:
        raise ValueError("Unsupported audio format. Please provide a WAV or MP3 file.")
        return duration

def is_mp3(file_path):
    """
    Check if the file has an MP3 extension.
    """
    _, file_extension = os.path.splitext(file_path)
    return file_extension.lower() == '.mp3'

@snoop
def convert_mp3_to_wav_with_ffmpeg(mp3_file_path, wav_file_path):

    if is_mp3(mp3_file_path):
        # Load MP3 file

        """
        Convert MP3 file to WAV format using ffmpeg.
        """
        # Build the ffmpeg command
        command = [
            'ffmpeg',  # The ffmpeg command
            '-i', mp3_file_path,  # Input file (MP3)
            '-acodec', 'pcm_s16le',  # Set audio codec to PCM (WAV format)
            '-ar', '44100',  # Set sample rate to 44100 Hz
            '-ac', '2',  # Set to stereo (2 channels)
            wav_file_path  # Output file (WAV)
        ]
        
        try:
            # Run the ffmpeg command
            subprocess.run(command, check=True)
            print(f"Converted {mp3_file_path} to {wav_file_path}")
        except subprocess.CalledProcessError as e:
            print(f"Error during conversion: {e}")
    else:
        print(f"{mp3_file_path} is not an MP3 file.")

def split_wav(filename_audio, path_audio_out, part_duration):
    # Ensure the output directory exists
    os.makedirs(path_audio_out, exist_ok=True)

    if is_mp3(filename_audio):
        convert_mp3_to_wav_with_ffmpeg(filename_audio, wav_file_path)

    try:
        with wave.open(wav_file_path, 'rb') as audio_file:
            # Get audio file parameters
            frame_rate = audio_file.getframerate()
            n_channels = audio_file.getnchannels()
            sampwidth = audio_file.getsampwidth()
            
            # Calculate the number of frames per part
            frames_per_part = int(frame_rate * part_duration)
            
            # Get total frames and duration
            total_frames = audio_file.getnframes()
            total_duration = total_frames / frame_rate
            
            # Initialize the progress bar
            with tqdm(total=total_duration, unit="s", desc="Splitting audio") as pbar:
                # Generate audio parts
                part_number = 1
                while audio_file.tell() < total_frames:
                    # Read frames for the current part
                    frames = audio_file.readframes(frames_per_part)
                    
                    # Define the part file name
                    part_file_path = os.path.join(path_audio_out, f"part_{part_number}.wav")
                    
                    # Write to a new WAV file
                    with wave.open(part_file_path, 'wb') as part_file:
                        part_file.setnchannels(n_channels)
                        part_file.setsampwidth(sampwidth)
                        part_file.setframerate(frame_rate)
                        part_file.writeframes(frames)
                        
                    print(f"Created {part_file_path}")
                    part_number += 1
                    
                    # Update the progress bar
                    pbar.update(min(part_duration, total_duration - audio_file.tell() / frame_rate))
    except Exception as e:
        print(f"Error while processing WAV file: {e}")
    finally:
        # Remove the temporary WAV file if it was created
        if is_mp3(filename_audio):
            os.remove(wav_file_path)

    print(f"Audio successfully split into {part_number - 1} parts.")

# Prepare the voice file
def prepare_voice_file(path: str) -> str:
    """
    Converts the input audio file to WAV format if necessary and returns the path to the WAV file.
    """
    if os.path.splitext(path)[1] == '.wav':
        return path
    elif os.path.splitext(path)[1] in ('.mp3', '.m4a', '.ogg', '.flac'):
        audio_file = AudioSegment.from_file(path, format=os.path.splitext(path)[1][1:])
        wav_file = os.path.splitext(path)[0] + '.wav'
        audio_file.export(wav_file, format='wav')
        return wav_file
    else:
        raise ValueError(f'Unsupported audio format: {format(os.path.splitext(path)[1])}')


# Write the transcribed text to the output file
def write_transcription_to_file(text, output_file) -> None:
    """
    Writes the transcribed text to the output file.
    """
    with open(output_file, 'a') as f:
        f.write(text)

# List the files in the folder
def list_files(folder_path):
    lfiles = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

    # Sort files by extracting the numeric part in the filename
    lfiles.sort(key=lambda f: int(re.search(r'\d+', f).group()) if re.search(r'\d+', f) else float('inf'))
    return lfiles

# Speech to text
def speech_to_text(filename_audio: str, duration_wav: float, output_path: str, language: str) -> None:
    """
    Transcribes an audio file at the given path to text and writes the transcribed text to the output file.
    """

    print(f"Get file: {filename_audio}")
    wav_file = prepare_voice_file(filename_audio)

    with sr.AudioFile(wav_file) as source:
        print("Start transcribing...")
        r = sr.Recognizer()
        audio_text = r.record(source, duration=duration_wav)
        
        try:
            print('Converting audio transcripts into text ...')
            # using google speech recognition
            text = r.recognize_google(audio_text, language =language) 
        except:
            print("A problem occured  ... Try again")

        write_transcription_to_file(text, output_path)

# Get the audio from command-line arguments
filename_audio = sys.argv[1]

print(f'>>> Audio: {filename_audio}')

if __name__ == '__main__':
    path_audio_out = 'audios_outs/'

    filename_audio_original = filename_audio.split('/')[-1].split('.')[0]
    output_path = f'texts/{filename_audio_original}.txt'

    language = 'en-US'
    part_duration = 40 # in seconds

    try:
        
        if is_mp3(filename_audio) == '.mp3':
            wav_file_path = 'audios/audio.wav'
            convert_mp3_to_wav_with_ffmpeg(filename_audio, wav_file_path)
        else:
            print('File is not mp3')
            wav_file_path = filename_audio
            
        duration = get_duration(wav_file_path)
        print(f'>>> Duration: {duration} seconds')
        
        print("Splitting audio file into parts ...")
        split_wav(wav_file_path, path_audio_out, part_duration)
        
        print("Transcribing audio parts ...")
        lfiles = list_files(path_audio_out)

        for file in tqdm(lfiles, desc="Processing Audio Parts"):
            print('---> Transcribing file:', file)
            speech_to_text(path_audio_out + file, part_duration, output_path, language)
            time.sleep(2)
            os.remove(path_audio_out + file)

        print("Done!")

    except Exception as e:
        print('Error:', e)
        exit(1)
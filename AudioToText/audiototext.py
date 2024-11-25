### https://github.com/Kini218/speech-to-text/blob/main/speech_to_text.py
### https://realpython.com/python-speech-recognition/

import os
import speech_recognition as sr
from pydub import AudioSegment
import snoop
from icecream import ic
from os import path
import webbrowser
import json
import wave
import re
import time
from tqdm import tqdm


def get_duration_wav(file_path):
    with wave.open(file_path, 'rb') as audio_file:
        frames = audio_file.getnframes()
        rate = audio_file.getframerate()
        duration = frames / float(rate)
        return duration

#@snoop
def split_wav(input_path, path_audio_out, part_duration):
    with wave.open(input_path, 'rb') as audio_file:
        # Get audio file parameters
        frame_rate = audio_file.getframerate()
        n_channels = audio_file.getnchannels()
        sampwidth = audio_file.getsampwidth()
        
        # Calculate the number of frames per part
        frames_per_part = int(frame_rate * part_duration)
        
        # Get total frames and duration
        total_frames = audio_file.getnframes()
        total_duration = total_frames / frame_rate
        
        # Initialize progress bar
        with tqdm(total=total_duration, unit="s", desc="Splitting audio") as pbar:
            # Generate parts
            part_number = 1
            while audio_file.tell() < total_frames:
                # Read frames for the part
                frames = audio_file.readframes(frames_per_part)
                
                # Define part file name
                part_file_path = f"{path_audio_out.split('.')[0]}{part_number}.wav"
                
                # Write to new file
                with wave.open(part_file_path, 'wb') as part_file:
                    part_file.setnchannels(n_channels)
                    part_file.setsampwidth(sampwidth)
                    part_file.setframerate(frame_rate)
                    part_file.writeframes(frames)
                    
                print(f"Created {part_file_path}")
                part_number += 1
                
                # Update progress bar
                pbar.update(part_duration)
    
    # Remove original file if desired
    os.remove(input_path)
    print(f"Deleted original file: {input_path}")

#@snoop
def prepare_voice_file(path: str) -> str:
    """
    Converts the input audio file to WAV format if necessary and returns the path to the WAV file.
    """
    if os.path.splitext(path)[1] == '.wav':
        return path
    elif os.path.splitext(path)[1] in ('.mp3', '.m4a', '.ogg', '.flac'):
        audio_file = AudioSegment.from_file(
            path, format=os.path.splitext(path)[1][1:])
        wav_file = os.path.splitext(path)[0] + '.wav'
        audio_file.export(wav_file, format='wav')
        return wav_file
    else:
        raise ValueError(
            f'Unsupported audio format: {format(os.path.splitext(path)[1])}')

#@snoop
def write_transcription_to_file(text, output_file) -> None:
    """
    Writes the transcribed text to the output file.
    """
    with open(output_file, 'a') as f:
        f.write(text)

def list_files(folder_path):
    lfiles = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

    # Sort files by extracting the numeric part in the filename
    lfiles.sort(key=lambda f: int(re.search(r'\d+', f).group()) if re.search(r'\d+', f) else float('inf'))
    return lfiles

#@snoop
def speech_to_text(input_path: str, duration_wav: float, output_path: str, language: str) -> None:
    """
    Transcribes an audio file at the given path to text and writes the transcribed text to the output file.
    """

    print(f"Get file: {input_path}")
    wav_file = prepare_voice_file(input_path)

    with sr.AudioFile(wav_file) as source:
        print("Start transcribing...")
        r = sr.Recognizer()
        audio_text = r.record(source, duration=duration_wav)
        
        try:
            print('Converting audio transcripts into text ...')
            # using google speech recognition
            text = r.recognize_google(audio_text, language =language)
            
            #print(text)   
        except:
            print("A problem occured  ... Try again")

        write_transcription_to_file(text, output_path)



if __name__ == '__main__':
    #print('Please enter the path to an audio file (WAV, MP3, M4A, OGG, or FLAC):')
    #input_path = input().strip()
    path_audio_out = 'audios_outs/'
    input_path = 'audios/audio.wav'
    output_path = 'texts/'

    
    #print('Please enter the path to the output file:')
    language = 'en-US'
    part_duration = 100 # in seconds

    try:
        duration = get_duration_wav(input_path) 
        print(f'>>> Duration: {duration} seconds')
        print("Splitting audio file into parts ...")
        split_wav(input_path, path_audio_out, part_duration)
        
        print("Transcribing audio parts ...")
        lfiles = list_files(path_audio_out)

        linknumber = 1
        for file in tqdm(lfiles, desc="Processing YouTube Links"):
            print('---> Transcribing file:', file)
            output_path = 'audiototext_link_' + f'{linknumber}' + '.txt'
            speech_to_text(path_audio_out + file, part_duration, output_path, language)
            time.sleep(2)
            os.system('rm ' + path_audio_out + file)
            linknumber += 1

        print("Done!")

    except Exception as e:
        print('Error:', e)
        exit(1)

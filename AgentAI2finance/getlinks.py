import os
import uuid
from yt_dlp import YoutubeDL
import whisper
from tqdm import tqdm

def download_audio(youtube_url, cookies_file=None):
    """
    Downloads audio from a YouTube video in WAV format, with optional cookies.
    """
    os.makedirs("audios", exist_ok=True)
    filename_id = uuid.uuid4().hex
    output_path = f"audios/audio_{filename_id}.%(ext)s"
    final_filename = f"audios/audio_{filename_id}.wav"

    print(f"Downloading audio from: {youtube_url}")

    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': output_path,
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'wav',
            'preferredquality': '192',
        }],
        'quiet': False,
        'no_warnings': True,
        'ignoreerrors': True,
    }

    if cookies_file and os.path.exists(cookies_file):
        ydl_opts['cookiefile'] = cookies_file
    elif cookies_file:
        print(f"File '{cookies_file}' NOT found. Ignoring cookies.")

    try:
        with YoutubeDL(ydl_opts) as ydl:
            ydl.download([youtube_url])
        print(f"Audio downloaded: {final_filename}")
        return final_filename
    except Exception as e:
        print(f"Error downloading audio: {e}")
        return None

def transcribe_audio_to_txt(audio_path, model_size="base"):
    """
    Transcribes audio using Whisper and saves as a .txt file.
    Deletes the audio file after transcription.
    """
    print(f"Transcribing audio: {audio_path}")
    model = whisper.load_model(model_size)

    # Corrected: no translate=True
    result = model.transcribe(audio_path, translate=True, verbose=False)
    segments = result.get('segments', [])

    # Build text with segment-level progress bar
    if segments:
        text = ""
        for segment in tqdm(segments, desc="Transcribing segments", unit="segment"):
            text += segment['text'] + " "
    else:
        text = result['text']

    # Ensure txts folder exists
    os.makedirs("txts", exist_ok=True)
    txt_filename = os.path.join("txts", os.path.basename(audio_path).replace(".wav", ".txt"))

    # Save transcription
    with open(txt_filename, "w", encoding="utf-8") as f:
        f.write(text.strip())
    print(f"Transcription saved: {txt_filename}")

    # Delete audio file
    os.remove(audio_path)
    print(f"Deleted audio file: {audio_path}")

if __name__ == "__main__":
    input_file = "youtube_video_links.txt"
    cookies_file = "cookies.txt"  # optional, for private videos

    try:
        with open(input_file, "r", encoding="utf-8") as f:
            links = [line.strip() for line in f if line.strip()]
    except FileNotFoundError:
        print(f"File '{input_file}' not found.")
        exit(1)

    if not links:
        print("No links found in the file.")
        exit(0)

    print(f"{len(links)} links found. Starting download and transcription...\n")

    for i, link in enumerate(links, 1):
        print(f"\n[{i}/{len(links)}] Processing: {link}")
        audio_file = download_audio(link, cookies_file=cookies_file)
        if audio_file:
            transcribe_audio_to_txt(audio_file)

    print("\nAll downloads and transcriptions have been processed.")

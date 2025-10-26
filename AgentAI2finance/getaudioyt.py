import os
import uuid
from yt_dlp import YoutubeDL
import whisper
from tqdm import tqdm  # progress bar

def download_audio(youtube_url, cookies_file=None):
    """
    Downloads audio from a YouTube video in WAV format.
    """
    try:
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

        with YoutubeDL(ydl_opts) as ydl:
            ydl.download([youtube_url])

        print(f"Audio downloaded: {final_filename}")
        return final_filename

    except Exception as e:
        print(f"Error downloading audio from {youtube_url}: {e}")
        return None


def transcribe_audio_to_file(audio_path, model_size="base"):
    """
    Transcribes audio using Whisper and translates from Portuguese to English.
    Saves transcription to a .txt file in txts folder.
    Deletes the audio file after transcription.
    """
    print(f"Transcribing and translating audio: {audio_path}")
    model = whisper.load_model(model_size)

    # Use translate=True to convert Portuguese (or any language) to English
    result = model.transcribe(audio_path, task="translate", verbose=False)
    segments = result.get('segments', [])

    # Progress bar for segments
    if segments:
        text = ""
        for segment in tqdm(segments, desc="Translating segments", unit="segment"):
            text += segment['text'] + " "
    else:
        text = result['text']

    # Ensure txts folder exists
    os.makedirs("txts", exist_ok=True)
    txt_filename = os.path.join("txts", os.path.basename(audio_path).replace(".wav", ".txt"))

    # Save translation
    with open(txt_filename, "w", encoding="utf-8") as f:
        f.write(text.strip())
    print(f"Translation saved: {txt_filename}")

    # Delete audio file
    os.remove(audio_path)
    print(f"Deleted audio file: {audio_path}")


if __name__ == "__main__":
    input_file = "data/youtube_video_links.txt"
    cookies_file = "cookies.txt"  # optional

    try:
        with open(input_file, "r", encoding="utf-8") as f:
            links = [line.strip() for line in f if line.strip()]
    except FileNotFoundError:
        print(f"File '{input_file}' not found.")
        exit(1)

    if not links:
        print("No links found in the file.")
        exit(0)

    print(f"{len(links)} links found. Starting download, transcription, and translation...")

    for i, link in enumerate(links, 1):
        print(f"\n[{i}/{len(links)}] Processing: {link}")
        audio_file = download_audio(link, cookies_file=cookies_file)
        if audio_file:
            transcribe_audio_to_file(audio_file)

    print("\nAll downloads, transcriptions, and translations have been processed.")

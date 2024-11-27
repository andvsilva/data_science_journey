
---

# **YouTube Audio Downloader & Transcriber**

This project is a Streamlit-based application that allows users to download audio from YouTube videos, transcribe the audio into text, and download the transcription.

## **Features**

- **Download Audio**: Extracts the audio in high-quality MP3 format from YouTube videos.
- **Transcribe Audio**: Converts audio files to text using Google Speech Recognition.
- **Multi-Language Support**: Supports transcription in multiple languages (e.g., English, Portuguese, Spanish, French).
- **Streamlined Workflow**: Provides a simple and interactive interface for downloading and transcribing audio.

---

## **Requirements**

### **Dependencies**
Ensure you have the following Python libraries installed:
- `streamlit`
- `yt-dlp`
- `speechrecognition`
- `pydub`
- `wave`
- `tqdm`

### **Installation**
To install the dependencies, run:
```bash
pip install streamlit yt-dlp SpeechRecognition pydub tqdm
```

### **Additional Requirements**
- **FFmpeg**: Required for audio conversion. Install it using:
  - On Linux:
    ```bash
    sudo apt update && sudo apt install ffmpeg
    ```
  - On macOS:
    ```bash
    brew install ffmpeg
    ```
  - On Windows:
    - Download from the [FFmpeg website](https://ffmpeg.org/download.html) and add it to your system PATH.

---

## **How to Run**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd your-repository
   ```

2. **Run the Streamlit App**:
   ```bash
   streamlit run app.py
   ```

3. **Use the Application**:
   - Enter a YouTube URL.
   - Choose the transcription language.
   - Click **"Download and Transcribe"** to download the audio and generate the transcription.

---

## **Project Structure**
```
.
├── app.py                 # Main Streamlit application
├── downloads/             # Folder for storing downloaded audio files
├── transcriptions/        # Folder for storing transcription text files
├── requirements.txt       # Dependency list
└── README.md              # Project documentation
```

---

## **Demo**

### **1. Downloading Audio**
![Audio Download Demo](https://example.com/audio-download-demo.gif)

### **2. Transcribing Audio**
![Transcription Demo](https://example.com/transcription-demo.gif)

---

## **Acknowledgments**

- **[yt-dlp](https://github.com/yt-dlp/yt-dlp)**: A powerful library for downloading videos and audio from YouTube.
- **[SpeechRecognition](https://pypi.org/project/SpeechRecognition/)**: Python library for performing speech recognition.
- **[Streamlit](https://streamlit.io/)**: Framework for building interactive web applications.

---

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **Contributions**

Contributions are welcome! Feel free to open issues or submit pull requests to improve this project.

---

Let me know if you need help personalizing the README or adding more sections!
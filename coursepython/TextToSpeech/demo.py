from gtts import gTTS
from playsound import playsound

text = "LOL this is really funny"
speech = gTTS(text=text, lang='en', slow=False)
speech.save("output.mp3")

playsound("output.mp3")

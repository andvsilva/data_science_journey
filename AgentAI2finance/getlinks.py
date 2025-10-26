import scrapetube
import os

#################################
# links
# get ID youtube channel:
# https://www.tunepocket.com/youtube-channel-id-finder/?srsltid=AfmBOoqoL08d08I_aIgI3iLThKOAKDgkK
#
#

# ==========================
# CONFIGURATION
# ==========================
#channel_id = "UCLJkh3QjHsLtK0LZFd28oGg"  # 🔁 replace with the YouTube channel ID @fernando
channel_id = "UCQpPo9BNwezg54N9hMFQp6Q" ## @nischa
output_folder = "data"                    # folder to save the file
output_file = os.path.join(output_folder, "youtube_video_links.txt")

# ==========================
# CREATE FOLDER IF NOT EXISTS
# ==========================
os.makedirs(output_folder, exist_ok=True)

# ==========================
# GET VIDEOS FROM CHANNEL
# ==========================
print("🔍 Fetching video links from the channel...")

videos = scrapetube.get_channel(channel_id)

print('links from the channel fetched successfully! now saving them to a file.')
# ==========================
# SAVE LINKS TO TXT FILE
# ==========================
count = 0
with open(output_file, "w", encoding="utf-8") as file:
    for video in videos:
        video_id = video['videoId']
        link = f"https://www.youtube.com/watch?v={video_id}"
        file.write(link + "\n")
        count += 1

print(f"✅ {count} links saved successfully to '{output_file}'!")

# ==========================
# DONE
# ==========================
print("🎉 Done!")
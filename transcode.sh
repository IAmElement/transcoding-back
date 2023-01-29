#!/bin/bash

# Check for new mp3 files
for file in /data/mp3/*.mp3; do
  if [ -f "$file" ]; then
    # Transcode the file into P25 frames
    ffmpeg -i "$file" -c:a pcm_s16le -ar 48000 -f mulaw output.p25
    # Send the P25 frames to the MMDVM board for transmission
    cat output.p25 > /dev/ttyACM0
    # Rename the processed file to the current date/time
    filename=$(date +"%Y-%m-%d_%H-%M-%S").mp3
    # Move the processed file to the archive directory
    mv "$file" /data/mp3/archive/$filename
  fi
done

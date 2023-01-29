#!/bin/bash

# Check for new mp3 files
for file in /data/mp3/*.mp3; do
  if [ -f "$file" ]; then
    # Transcode the file into P25 frames
    ffmpeg -i "$file" -c:a pcm_s16le -ar 48000 -f mulaw output.p25
    # Move the resulting P25 frames to the dump directory
    mv output.p25 /data/p25/
  fi
done

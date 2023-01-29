FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y ffmpeg libmp3lame-dev && \
    apt-get clean

# Create the working directory
RUN mkdir /app
WORKDIR /app

# Copy the script to the container
COPY transcode.sh .

# Set the script to be executed every second
CMD watch -n 1 ./transcode.sh

#!/bin/bash

# Loop through all folders
for dir in {1..99}; do
  # Check if folder exists
  if [ -d "${dir}" ]; then
    # Change to folder
    cd "${dir}"
    
    # Run ffmpeg command
    ffmpeg -r 4 -i '4p-000%02d.jpg' -vf "scale=-2:1080,format=yuv420p" -c:v libx264 -r 4 slideshow.mp4
    
    # Log message
    echo "Processed folder ${dir}."
    
    # Change back to root directory
    cd ..
  fi
done

#!/bin/bash

# Run ffmpeg command
ffmpeg -r 4 -i '4p-%05d.jpg' -vf "scale=-2:1080,format=yuv420p" -c:v libx264 -r 4 slideshow.mp4
echo "Ran ffmpeg command."

# Run other scripts
for script in 01-*.sh 02-*.sh 03-*.sh 04-*.sh 05-*.sh; do
  if [ -e "${script}" ]; then
    chmod +x "${script}"
    ./"${script}"
    echo "Ran ${script}."
  else
    echo "Script ${script} does not exist, skipping."
  fi
done

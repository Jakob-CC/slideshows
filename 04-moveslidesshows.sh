#!/bin/bash

# Loop through all folders
for dir in {1..99}; do
  # Check if folder exists
  if [ -d "${dir}" ]; then
    # Change to folder
    cd "${dir}"
    
    # Check if slideshow.mp4 exists
    if [ -e "slideshow.mp4" ]; then
      # Rename and move slideshow.mp4
      new_name=$(printf "../4p-slides-fast-%02d.mp4" ${dir})
      mv "slideshow.mp4" "${new_name}"
      echo "Renamed and moved slideshow.mp4 to ${new_name}"
    else
      echo "slideshow.mp4 does not exist in folder ${dir}, skipping."
    fi
    
    # Change back to root directory
    cd ..
  fi
done


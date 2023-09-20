#!/bin/bash

# Loop through all folders
for dir in {1..99}; do
  # Check if folder exists
  if [ -d "${dir}" ]; then
    # Change to folder
    cd "${dir}"
    
    # Initialize counter
    counter=1
    
    # Loop through files in folder and rename
    for file in $(ls 4p-*.jpg | sort -n); do
      new_name=$(printf "4p-%05d.jpg" ${counter})
      mv "${file}" "${new_name}"
      echo "Renamed ${file} to ${new_name}"
      
      # Increment counter
      ((counter++))
    done
    
    # Change back to root directory
    cd ..
  fi
done


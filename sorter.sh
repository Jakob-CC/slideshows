#!/bin/bash

# Initialize counters and variables
folder=1
file_count=0

# Loop through all folders
for dir in {1..8}; do
  # Check if folder exists
  if [ -d "${dir}" ]; then
    # Loop through files in folder
    for file in ${dir}/4p-*.jpg; do
      # Check if file exists
      if [ -e "${file}" ]; then
        # Move file back to root directory
        mv "${file}" .
        echo "Moved ${file} back to root directory."
      fi
    done
  fi
done

# Redistribute files
for file in 4p-*.jpg; do
  # Check if file exists
  if [ -e "${file}" ]; then
    # Create folder if it doesn't exist
    if [ ! -d "${folder}" ]; then
      mkdir "${folder}"
      echo "Created folder ${folder}."
    fi
    
    # Move file to folder
    mv "${file}" "${folder}/"
    echo "Moved ${file} to folder ${folder}."
    
    # Increment file counter
    ((file_count++))
    
    # If 8 files in folder, reset counter and increment folder number
    if [ ${file_count} -eq 8 ]; then
      file_count=0
      ((folder++))
    fi
  fi
done

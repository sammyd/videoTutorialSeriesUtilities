#!/bin/bash

#######
# This script takes a file of video names and a location.
# Each line of the video list should be the name of the
# video you will create, in order. These will be prefaced 
# with a 0-padded number.
# The output location shouldn't already exist.
# Check that for documentation - clear as mud
#######

# Need one and only one parameter
if [ $# -ne 2 ]; then
  echo "Usage: $0 <video list file> <path to output>"
  echo "No spaces or such funny characters are allowed."
  exit 1
fi

# List of video names
videoList=$1
if [ ! -f "$videoList" ]; then
  echo "Error: the video list should exist"
  exit 1
fi

# Output location
outputDir=$2

if [ -d "$outputDir" ]; then
  echo "Error: the output directory must not exist already"
  exit 1
fi


# Create the output directory
mkdir -p "$outputDir"

# Loop through the lines of the video list file
videoIndex=1
while read videoName; do
  # Check it's not a whitespace string
  if [[ ! $videoName =~ ^\ +$ ]] ;then 
    echo "Creating structure for $videoName"

    zeroPaddedIndex=`echo "$videoIndex" \
    | sed "s/\(.*\)/000000\1/" \
    | egrep -o ".{3}$"`

    # Create the top-level dir for this project
    videoRootDir="${outputDir}/${zeroPaddedIndex}_${videoName}/"
    mkdir -p $videoRootDir

    videoIndex=$((videoIndex + 1))   
  fi
done <$1

echo "Directory structure creation completed"

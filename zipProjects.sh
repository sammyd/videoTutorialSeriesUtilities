#!/bin/bash

# Need two parameters
if [ $# -ne 2 ]; then
  echo "Usage: $0 <path to videos directory> <path to output dir>"
  echo "    No spaces or such funny characters are allowed."
  exit 1
fi

# Location for the output
stagingDir="$2"

if [ -d "$stagingDir" ]; then
  echo "Error: the staging directory must not exist already"
  exit 1
fi

# Create the staging directory
mkdir -p "$stagingDir"

cp -R "$1"/* "$stagingDir"


echo "Removing empty directories"
find "$stagingDir" -empty -type d -delete

echo "Removing .DS_Store"
find "$stagingDir" -name ".DS_Store" -delete

echo "Removing stray .gitignore"
find "$stagingDir" -name ".gitignore" -delete

echo "Removing xcuserdata"
find "$stagingDir" -name "xcuserdata" -exec rm -r {} +


# Do the actual zipping
echo "Doing some actual zipping"

pushd "$stagingDir"
for videoDir in */
do
  pushd "$videoDir"
  for projectDir in */
  do
    projDir=`basename "$projectDir"`
    echo "Zipping $projDir"
    zip -r "$projDir.zip" "$projDir"
  done
  popd
done

popd



#!/bin/bash

# Script to regenerate thumbnails after adding new photos.
# Requires ImageMagick.

REL_PATH="img/photos"
YEAR_REGEX="[0-9]{4}"

cd $REL_PATH
for d in */; do
  if [[ $d =~ $YEAR_REGEX ]];
  then
      echo "Processing $d..."
      cd $d
      mkdir -p thumbs
      for file in *; do
        if [ ! -d "$file" ]; then
          convert $file -resize 320x280^ -gravity center -extent 320x280 thumbs/$file
        fi
      done
      cd ..
  fi
done
cd ..

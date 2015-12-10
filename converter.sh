#!/bin/bash
export LOCATION=`pwd`
find $1 -name "*.xml" -type f -execdir sh $LOCATION/contents.sh {} xml \;
find $1 -name "*.chatlog" -type f -execdir sh $LOCATION/contents.sh {} chatlog \;
find $1 -type d -maxdepth 1 -mindepth 1 -name "*.*"  -execdir sh $LOCATION/directories.sh {} \;
find $1 -name "*.chatlog" -exec rm -r {} +
#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME=`basename $0`; FILE=$(echo $FILENAME | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME] [$FILE]
echo "......."
cd $BASEDIR00
./execute.sh
./upload.sh
exit 0

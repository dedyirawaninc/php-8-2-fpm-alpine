#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR0="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR0=${BASEDIR0##*/}
FILENAME=`basename $0`; FILE=$(echo $FILENAME | cut -d '.' -f 1)
echo [$BASEDIR0] [$CURRDIR0] [$FILENAME] [$FILE]
echo "......."
cd $BASEDIR0 && cd ..
TYPE=$(uname -s | cut -d '_' -f 1) && echo [$TYPE]
if [ "$TYPE" == "CYGWIN" ]; then
  echo "docker is not applicable $TYPE"
fi
if [ "$TYPE" == "Darwin" ]; then
  find . -type f -iname "*.sh" -exec dos2unix {} \;
fi
if [ "$TYPE" == "Linux" ]; then
  find . -type f -iname "*.sh" -exec dos2unix {} \;
fi
exit 0

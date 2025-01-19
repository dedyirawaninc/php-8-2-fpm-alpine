#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [${BASEDIR00}] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
BASEDIR01=${BASEDIR00%/*}; CURRDIR01=${BASEDIR01##*/}
echo [01] [$BASEDIR01] [$CURRDIR01]
echo "......."
if [ -z "$1" ]; then
  echo "Require parameter 1"
  exit 0
fi
echo $CURRDIR01 $CURRDIR00 $FILE $1
chown -Rv $1 .
if [ -d .git ]; then
  chown -Rv $1 .git
fi
exit 0

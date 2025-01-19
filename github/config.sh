#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [${BASEDIR00}] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd ${BASEDIR00} && cd ..
git config --local user.name "Dedy Irawan"
git config --local user.email dedy.irawan.inc@hukumonline.com
exit 0

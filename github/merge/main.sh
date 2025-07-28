#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [${BASEDIR00}] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
git status
git checkout main
git pull origin main
git merge develop
git add .
git commit
git push origin main
exit 0

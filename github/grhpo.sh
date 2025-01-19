#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [${BASEDIR00}] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo git reset hard pull origin $BRANCH
git reset --hard
git pull -v origin $BRANCH
USERNAME=$(whoami)
sudo chmod 755 ${BASEDIR00}/tools/chmod.sh
sudo dos2unix ${BASEDIR00}/tools/chmod.sh
sudo ${BASEDIR00}/tools/chmod.sh 755
sudo chmod 755 ${BASEDIR00}/tools/chown.sh
sudo dos2unix ${BASEDIR00}/tools/chown.sh
sudo ${BASEDIR00}/tools/chown.sh $USERNAME
exit 0

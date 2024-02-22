#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME=`basename $0`; FILE=$(echo $FILENAME | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME] [$FILE]
echo "......."
BASEDIR01=${BASEDIR00%/*}; CURRDIR01=${BASEDIR01##*/}
BASEDIR02=${BASEDIR01%/*}; CURRDIR02=${BASEDIR02##*/}
BASEDIR03=${BASEDIR02%/*}; CURRDIR03=${BASEDIR03##*/}
echo [$BASEDIR01] [$CURRDIR01]
echo [$BASEDIR02] [$CURRDIR02]
echo [$BASEDIR03] [$CURRDIR03]
echo "......."
cd $BASEDIR00 && cd ../../
COMPA=$(echo $FILE | cut -d '-' -f 1)
GROUP=$(echo $FILE | cut -d '-' -f 2)
IMAGE=dedyirawaninc/${CURRDIR03} && echo $IMAGE
if [ "$COMPA" != "$GROUP" ]; then
  IMAGE=${IMAGE}_${GROUP}:${CURRDIR00}
else
  IMAGE=${IMAGE}:${CURRDIR00}
fi
echo [$CURRDIR00] [$GROUP] [$IMAGE]
PASSWORD=$(< ./password.txt)
USERNAME=$(< ./username.txt)
echo [$USERNAME] [$PASSWORD]
TYPE=$(uname -s | cut -d '_' -f 1) && echo [$TYPE]
if [ "$TYPE" == "Darwin" ]; then
  security -v unlock-keychain ~/Library/Keychains/login.keychain-db
  echo $PASSWORD | docker login docker.io -u $USERNAME --password-stdin
  docker push $IMAGE
  docker push $IMAGE
else
  echo $PASSWORD | sudo docker login docker.io -u $USERNAME --password-stdin
  sudo docker push $IMAGE
  sudo docker push $IMAGE
fi
exit 0

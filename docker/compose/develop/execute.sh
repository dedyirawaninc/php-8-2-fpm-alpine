#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME=`basename $0`; FILE=$(echo $FILENAME | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME] [$FILE]
echo "......."
cd $BASEDIR00
VERTICAL="\nID\t\t{{.ID}}\nImage\t\t{{.Image}}\nCommand\t\t{{.Command}}\nCreated\t\t{{.RunningFor}}\nStatus\t\t{{.Status}}\nPorts\t\t{{.Ports}}\nNames\t\t{{.Names}}\n"
if [ "$TYPE" == "Darwin" ]; then
  docker-compose up -d --force-recreate
  docker ps -a --format=$VERTICAL
else
  sudo docker-compose up -d --force-recreate
  sudo docker ps -a --format=$VERTICAL
fi
nmap -p 3010 localhost
nmap -p 3011 localhost
exit 0

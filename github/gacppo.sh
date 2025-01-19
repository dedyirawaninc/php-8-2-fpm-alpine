#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [${BASEDIR00}] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo git add commit pull push origin $BRANCH
git config --global core.bare false
git config --global core.bigfilethreshold "200K"
git config --global core.compression 9
git config --global core.filemode false
git config --global core.ignorecase true
git config --global core.logallrefupdates true
git config --global core.repositoryformatversion 0
git config --global pack.deltaCacheSize "512m"
git config --global pack.packSizeLimit "50m"
git config --global pack.SizeLimit "512m"
git config --global pack.threads 1
git config --global pack.window 0
git config --global pack.windowMemory "128m"
git config --global pull.rebase false
git config --global user.name "Dedy Irawan"
git config --global user.email dedy.irawan.inc@hukumonline.com
git add .
git commit -a -m "$1 $2 $3 $4 $5 $6 $7 $8 $9"
git pull -v origin $BRANCH
git push -uv origin $BRANCH
exit 0

BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
USERNAME=$(whoami)
sudo chmod 755 ${BASEDIR00}/chmod.sh
sudo dos2unix ${BASEDIR00}/chmod.sh
sudo ${BASEDIR00}/chmod.sh 755
sudo chmod 755 ${BASEDIR00}/chown.sh
sudo dos2unix ${BASEDIR00}/chown.sh
sudo ${BASEDIR00}/chown.sh $USERNAME

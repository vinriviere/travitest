#!/bin/bash -eu
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.

VERSION=$(date +%Y%m%d)-$(git rev-parse --short $TRAVIS_COMMIT)

echo "deploy start"
echo "MYVAR=$MYVAR"
echo "MYVAR2=$MYVAR2"
echo "$MYVAR $MYVAR2" |xxd
du -a ~/.ssh
#set -x
#cat ~/.ssh/authorized_keys
#cat ~/.ssh/known_hosts
#set +x
#mv release-archives $VERSION
#ps
#env

set -x

LOCAL_DIRNAME=release-archives
REMOTE_DIRNAME=$VERSION
SSH_USER=vriviere,emutos
SSH_HOST=frs.sourceforge.net
SSH_PATH=/home/pfs/p/emutos/travis

echo "Deploying $LOCAL_DIRNAME to $SSH_HOST:$SSH_PATH/$REMOTE_DIRNAME"
scp -o StrictHostKeyChecking=no -r release-archives $SSH_USER@$SSH_HOST:$SSH_PATH/$REMOTE_DIRNAME

echo "deploy end"
exit 0

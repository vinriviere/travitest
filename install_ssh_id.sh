#!/bin/bash -eu
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.

if [ -z ${SSH_ID+x} ]
then
  echo "error: SSH_ID is undefined" >&2
  exit 1
fi

echo $SSH_ID | base64 -d | tar -C ~ -Jx
ls -l ~/.ssh/

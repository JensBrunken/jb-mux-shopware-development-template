#!/usr/bin/env bash
#DESCRIPTION: test mkdir on server

SSH_USER=$1
SSH_HOST=$2
SSH_PATH=$3

ssh $SSH_USER@$SSH_HOST "
    if [ ! -e $SSH_PATH ]
      then
        echo "the -- $SSH_PATH -- not exists on -- $SSH_HOST --"
        mkdir -p $SSH_PATH
        echo "the -- $SSH_PATH -- was created on -- $SSH_HOST --"
      else
        echo "the -- $SSH_PATH -- already exists on -- $SSH_HOST --"
    fi
"





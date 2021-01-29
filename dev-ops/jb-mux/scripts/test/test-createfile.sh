#!/usr/bin/env bash
#DESCRIPTION: test create file on server

SSH_USER=$1
SSH_HOST=$2
SSH_PATH=$3
MUX_TEST_FILE=$4

ssh $SSH_USER@$SSH_HOST "
  cd $SSH_PATH
    if [ ! -e $MUX_TEST_FILE ]
      then
        touch $MUX_TEST_FILE
        if [ ! -e $MUX_TEST_FILE ] ;
          then
            echo "cant create the -- $MUX_TEST_FILE -- on -- $SSH_HOST -- under -- $SSH_PATH --" ;
            exit 1
          else
            echo "the -- $MUX_TEST_FILE -- was created on -- $SSH_HOST -- under -- $SSH_PATH --"
        fi
      else
        echo "the -- $MUX_TEST_FILE -- file already exists on -- $SSH_HOST -- under -- $SSH_PATH --"
    fi
"


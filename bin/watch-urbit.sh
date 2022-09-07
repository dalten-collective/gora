#!/bin/bash
set -e

echo "(('export GORA_DESK_PATH=your/path/here' to avoid this prompt))"

if [[ ${GORA_DESK_PATH} && ${GORA_DESK_PATH-x} ]]; then
  DESK_PATH=$GORA_DESK_PATH
else
  while true; do    # TODO
    printf "\nEnter the path to your desk (like ~/urbit/gora-zod/gora): "
    read USER_PATH
    printf "\nYou entered: $USER_PATH. Okay? (y/n)"
    read -n 1 decision
    case $decision in
      [yY])
        printf "\nOkay."
        break
      ;; # contiue
      [nN]) # try again
    esac
  done
  DESK_PATH=$USER_PATH
fi

watch cp -RL ./vue/* $DESK_PATH

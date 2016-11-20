#/usr/bin/bash

#!/usr/bin/env bash
# Synchronizes this computer's vim environment to remote boxes
#
# Usage:
#
# $ ./vimsync.sh [BOXES]
#
# If BOXES is not specified, the default list will be used (see
# implementation a couple of lines below)
# BOXES is a space separated list of BOXES of the form
# [user1@]BOXNAME1 [user2@]BOXNAME2 ...
#
# IMPORTANT NOTE:
#
# You MUST run this script from your home directory

## default boxes to sync to
if [[ $# -eq 0 ]]; then
  # defaults
  declare -a boxes=($BOX1 $BOX2 "otheruser@$BOX3")
else
  declare -a boxes=($@)
fi

## files to synchronize
declare -a files=(".vimrc" ".screenrc")

## directories to create/synchronize
declare -a directories=(".vim/colors" ".vim/UltiSnips" ".vim/autoload")

## sexyness
BLACK='setaf 0'
RED='setaf 1'
GREEN='setaf 2'
YELLOW='setaf '
BLUE='setaf 4'
MAGENTA='setaf 5'
CYAN='setaf 6'
GRAY='setaf 7'
NC='sgr0'

function echocolor() { # $1 = string, $2 color
    if [ "$2" ]; then
      color="$2"
    else
      color=${GREEN}
    fi
    tput ${color};
    echo "$1";
    tput ${NC};
}

## loop through the above arrays
for box in "${boxes[@]}"
do

  # need -e to allow backslash escapes
  echocolor "[Syncing to ${box}]" "${CYAN}"

  # create required directories
  for dir in "${directories[@]}"
  do
    # first make sure the directory exists
    cmd="ssh ${box} test -d ${dir} || mkdir -p ${dir}"
    echocolor "> ${cmd}" "${GRAY}"
    $cmd

    # and the synchronize
    cmd="rsync -avzhe ssh ${dir}/ ${box}:${dir}/"
    echocolor "> ${cmd}" "${GRAY}"
    $cmd
  done

  # clone Vundle.vim if necessary
  cmd="ssh ${box} test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
  echocolor "> ${cmd}" "${GRAY}"
  $cmd

  # sync files
  for file in "${files[@]}"
  do
    #cmd="scp $HOME/$file ${box}:/home/jorge.herrera/$file"
    cmd="rsync -avzhe ssh $HOME/$file ${box}:~/$file"
    echocolor "> ${cmd}" "${GRAY}"
    $cmd
    #echo "done"
  done

  # need -e to allow backslash escapes
  echocolor "[Done with ${box}]" "${GREEN}"

done

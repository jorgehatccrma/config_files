#!/bin/sh

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0
# startup a "default" session if non currently exists
# tmux has-session -t _default || tmux new-session -s _default -d

NEW_VANILLA_SESSION="$(tput setaf 2)New Vanilla tmux Session$(tput sgr0)"
NEW_DEV_SESSION="$(tput setaf 2)New Development tmux Session$(tput sgr0)"
BASH_SESSION="$(tput setaf 2)Bash$(tput sgr0)"

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=("$NEW_VANILLA_SESSION" "$NEW_DEV_SESSION" $(tmux list-sessions -F "#S" 2>/dev/null) "$BASH_SESSION")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
  case $opt in
    $NEW_VANILLA_SESSION)
      read -p "Enter new session name: " SESSION_NAME
      # tmux -2 -v new -s "$SESSION_NAME"
      tmux -2 new -s "$SESSION_NAME"
      break
      ;;
    $NEW_DEV_SESSION)
      read -p "Enter new session name: " SESSION_NAME
      read -e -p "Enter root directory: " BASE_DIR

      # if $BASE_DIR doesn't exist, ask user if want to create it
      if ! [ -d $BASE_DIR ]
      then
        read -p "Directory $BASE_DIR doesn't exist. Would you like to create it? [y/n] " YN
        if [[ $YN == "y" || $YN == "Y" || $YN == "" ]]
        then
          mkdir -p $BASE_DIR
          echo "Directory $BASE_DIR created"
        else
          echo "Aborting. Bye!"
          exit
        fi
      # else
      #   echo "dir present"
      fi

      pushd "${BASE_DIR/#\~/$HOME}"
      tmux new -d -s "$SESSION_NAME" -n "dev"
      tmux split-window -h
      tmux swap-pane -D
      tmux split-window -v
      popd > /dev/null
      tmux -2 attach-session -d -t "$SESSION_NAME"
      break
      ;;
    $BASH_SESSION)
      bash --login
      break;;
    *)
      tmux -2 attach-session -t $opt
      break
      ;;
  esac
done


#!/bin/sh

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0
# startup a "default" session if non currently exists
# tmux has-session -t _default || tmux new-session -s _default -d

NEW_VANILLA_SESSION="$(tput setaf 6)New Vanilla tmux Session$(tput sgr0)"
NEW_DEV_SESSION="$(tput setaf 6)New Development tmux Session$(tput sgr0)"
BASH_SESSION="$(tput setaf 6)Bash$(tput sgr0)"

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
			tmux new -d -s "$SESSION_NAME" -n "dev"
      tmux split-window -h
      tmux swap-pane -D
      tmux split-window -v
      tmux -2 attach-session -d -t "$SESSION_NAME"
			break
			;;
		"bash")
			bash --login
			break;;
		*)
			tmux -2 attach-session -t $opt
			break
			;;
	esac
done


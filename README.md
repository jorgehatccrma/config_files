config_files
============

personal config files and environment setup notes


## bash

I've decided to break up my `.bash_profile` into logical "modules" to group
related functionality. The reason is just it was growing out of control, so it
was getting harder to quickly find stuff in the file.

To do so, I created a folder to containe the "modules" (just a fancy way to
refer to simple bash commands / scripts). Specific modules can be "imported" in
the main `.bash_profile` by simply adding:

```
SCRIPTS_FOLDER="$HOME/bash_profile_scripts"

. "$SCRIPTS_FOLDER/basic.sh"
. "$SCRIPTS_FOLDER/aliases.sh"
. "$SCRIPTS_FOLDER/utils.sh"
. "$SCRIPTS_FOLDER/prompt.sh"
. "$SCRIPTS_FOLDER/go_env.sh"
. "$SCRIPTS_FOLDER/mark_system.sh"
```

etc.

Ideally this is all that would exist in my `.bash_profile`, but in reality I
keep some minor configs in there while I decide if they belong to a new or an
existing module.


## tmux

Currently, my tmux setup if fairly simple, and comprise only two files:

- .tmux.conf
- .tmux-osx.conf


## Vim

The vim setup is slightly more involved, so for now is in its [own
repo](https://github.com/jorgehatccrma/vimconfig)

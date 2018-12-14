config_files
============

personal config files and environment setup notes


## bash

### Usage

1. Clone this repo somewhere on your computer.
2. Create links to the scripts you need. E.g.:
```
ln <PATH_TO_CLONED_REPO>/.tmux.conf
ln <PATH_TO_CLONED_REPO>/tm $HOME/bin/tm
ln <PATH_TO_CLONED_REPO>/dark.conf $HOME/dark.conf
ln <PATH_TO_CLONED_REPO>/light.conf $HOME/light.conf
```

3. Profit


### Notes

I've decided to break up my `.bash_profile` into logical "modules" to group
related functionality. The reason is just it was growing out of control, so it
was getting harder to quickly find stuff in the file.

To do so, I created a folder to contained the "modules" (just a fancy way to
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

### TMux with iTerm (my conf)

When using my tmux configuration with iTerm2, you will probably want to change
your iTerm preferences. In particular, you need to make the option keys (at
least the right-option key) to emmit an `ESC+` (as oppose to `Normal` option,
as it defaults to). To do this, simply open iTerm preferences and go to the
**Profiles** section. There, select the profile you use (e.g. Default) and go
to the `Keys` subsection (not the top level `Keys`, but the profile's `Keys`).
Look for the option keys and select the `Esc+` option for either or both of
them.


## Vim

The vim setup is slightly more involved, so for now is in its [own
repo](https://github.com/jorgehatccrma/vimconfig)

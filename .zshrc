#!/bin/zsh
0=${${(M)${0::=${(%):-%x}}:#/*}:-$PWD/$0}
###############################################################################
#  My zsh configuration file! This file is sourced by zsh when it starts up.  #
#   This file sets the shell to: clear the screen, set aliases, functions,    #
#               options, configurations, and loads extensions.                #
#                                                                             #
#     This is also the nexus of the configuration, as this file sources:      #
#   `.zsh_internal_functions`, `.zsh_interactive_functions`, `.zsh_binds`,    #
#          `.zsh_aliases`, `.zsh_options`, `.path`, and `.localrc`.           #
###############################################################################

## Clear the screen before starting source.
clear

## Get operating system information.
source /etc/os-release

## Make required files/directories if they do not exist.
if [[ ! -f ${HOME}/.path ]]; then
  touch "${HOME}"/.path
fi
if [[ ! -f "${HOME}"/.localrc ]]; then
  touch "${HOME}"/.localrc
fi

## Sources/Imports.
### Tracked/Universally sourced files.
source "${HOME}"/.zsh_internal_functions    # Prerequisite internal functions.
#### [zsh_internal_functions<↑>, zsh_interactive_functions<↓>]
source "${HOME}"/.zsh_interactive_functions # User facing Functions.
#### [zsh_internal_functions<↑>, zsh_binds<↓>]
source "${HOME}"/.zsh_binds                 # Keybinds.
source "${HOME}"/.zsh_aliases               # Aliases.
#### [zsh_internal_functions<↑>, zsh_options<↓>]
source "${HOME}"/.zsh_options               # General shell behavior options.
source "${HOME}"/.zsh_extensions            # Extensions to zsh.
### Untracked/System specific files.
source "${HOME}"/.path                      # Path additions.
source "${HOME}"/.localrc                   # Additional configuration.


## Commands to run at startup.
### Show Hayabusa Banner.
banner
### Update dotfiles, if not disabled.
[[ -v SKIP_UPDATE ]] && \
( git -C "$HOME" pull --ff-only > /dev/null ) &

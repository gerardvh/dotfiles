#!/usr/bin/env bash

# Find all the 'zplugs.sh' files and source them for relevant plugins
for plug_file ($DOTFILES/**/zplugs.sh) source $plug_file

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Load plugins
zplug load

#!/usr/bin/env fish

set -l FISH_DIR (dirname (status --current-filename))
# echo "This directory: $FISH_DIR"

# Add fish folder if it doesn't exist
mkdir -p ~/.config/fish

# Symlink everything in the fish sibling-folder with the '.symlink' ext.
for file in (find -H $FISH_DIR -name "*.symlink")
  set -l dest_name (string replace '.symlink' '' (basename $file))
  set -l full_src (realpath $file)
  set -l full_dest (realpath $fish_config)"/$dest_name"
  ln -sFv $full_src $full_dest
end


# Install fisherman from github ()
set -l fisherman ~/.config/fish/functions/fisher.fish
if test -e $fisherman
  # Alredy have fisherman installed
  echo "Fisherman is already installed. No need to install."
  echo "Remove $fisherman if you would like to reinstall."
else
  # Don't have fisherman installed, install it
  echo "About to install Fisherman to: $fisherman"
  # curl -Lo $fisherman --create-dirs https://git.io/fisher
end

# Link fishfile
# ln -sF $DOTS/fish-shell/fish/fishfile.symlink ~/.config/fish/fishfile

# Run fisherman install
# fisher

#!/usr/bin/env fish

set -l FISH_DIR (dirname (status --current-filename))

# Add fish folder if it doesn't exist
set -l fish_config_dir "$HOME/.config/fish"
mkdir -p $fish_config_dir

# Symlink everything in the fish sibling-folder with the '.symlink' ext.
for file in (find -H $FISH_DIR -maxdepth 2 -name "*.symlink")
  set -l dest_name (string replace '.symlink' '' (basename $file))
  set -l full_src (realpath $file)
  set -l full_dest (realpath $fish_config_dir)"/$dest_name"

  # Need special behavior if the existing destination is a symlink or dir
  if test -h $full_dest
    echo Symlink already exists at $full_dest, skipping.
  else
    if test -d $full_dest
      echo "Backing up existing directory:"
      echo "$full_dest ---> $full_dest.backup"
      mv -f $full_dest "$full_dest.backup"
    end
    echo "$full_src ------> $full_dest"
    ln -sF $full_src $full_dest
  end
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
  curl -Lo $fisherman --create-dirs https://git.io/fisher
end

# Run fisherman install
fisher

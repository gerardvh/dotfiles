# Add fish folder if it doesn't exist
mkdir -p ~/.config/fish

# Symlink everything in the fish sibling-folder with the '.symlink' ext.



# Install fisherman from github ()
set -l fisherman ~/.config/fish/functions/fisher.fish
if test -e $fisherman
  # Alredy have fisherman installed
  echo 'Fisherman is already installed. Remove $fisherman before re-installing.'
else
  # Don't have fisherman installed, install it
  # curl -Lo $fisherman --create-dirs https://git.io.fisher
  echo "About to install Fisherman to: $fisherman"
end

# Link fishfile
link -sF $DOTS/fish/fishfile ~/.config/fish/fishfile

# Run fisherman install
fisher

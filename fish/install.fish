# Install fisherman from github ()
set -l fisherman ~/.config/fish/functions/fisher.fish
if test -e $fisherman
  # Alredy have fisherman installed
  echo 'Fisherman is already installed. Remove $fisherman before re-installing.'
else
  # Don't have fisherman installed, install it
  curl -Lo $fisherman --create-dirs https://git.io.fisher
end

# Link fishfile
link -sF $DOTFILES_ROOT/fish/fishfile ~/.config/fish/fishfile

# Run fisherman install
fisher

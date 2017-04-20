# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/vim

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  if [ -x /usr/bin/pip ]; then
    pip install flake8
  else
    echo "Unable to find pip, the flake8 vim plugin might not work, please install pip on your system and run: 'pip install flake8'."
  fi
  vim +PlugUpgrade +PlugUpdate +qall
fi

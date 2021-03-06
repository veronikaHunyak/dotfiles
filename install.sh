#!/bin/sh

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] &&
        [ "$name" != 'setup.sh' ] &&
        [ "$name" != 'README.md' ] &&
        [ "$name" != 'Brewfile' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

find bin -type f -exec chmod +x {} \;

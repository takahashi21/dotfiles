#!/usr/bin/env bash

DOTPATH="$HOME/dotfiles"

if [ ! -e "$DOTPATH" ]; then
    echo "Error: Directory $DOTPATH does not exist."
    exit 1
fi

cd "$DOTPATH" || exit 1

for file in .??*; do
    [[ "$file" = ".git" ]] && continue
    [[ "$file" = ".DS_Store" ]] && continue
    [[ "$file" = ".gitignore" ]] && continue

    ln -fvns "$DOTPATH/$file" "$HOME/$file"

    source ~/.zshrc
done

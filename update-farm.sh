#!/bin/bash

PACKAGES=(
    bash
    zsh
    xorg
    feh
    i3
)

for PKG in ${PACKAGES[@]}; do
    CONFLICTS=$(stow --no --verbose $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
    for filename in ${CONFLICTS[@]}; do
        if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
            echo "DELETE: $filename"
            rm -f "$HOME/$filename"
        fi
    done

    stow -v -R -t ~ $PKG
done

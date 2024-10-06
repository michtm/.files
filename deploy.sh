#!/usr/bin/env bash

mkdir -p ~/.config/git && stow -vR -t ~/.config/git git
mkdir -p ~/.config/emacs && stow -vR -t ~/.config/emacs emacs

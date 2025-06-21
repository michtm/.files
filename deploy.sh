#!/usr/bin/env bash

root_dir=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")

# nvim
ln -s -f $root_dir/nvim ~/.config 
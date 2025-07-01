#!/usr/bin/env bash

root_dir=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")

# clang-format
ln -s -f $root_dir/.clang-format ~/
# nvim
ln -s -f $root_dir/nvim ~/.config
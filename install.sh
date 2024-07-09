#!/usr/bin/env bash

DIR=$(dirname $(readlink -f "$0"))

echo "source $DIR/common/.zshrc" >> $HOME/.zshrc
echo "source $DIR/common/.vimrc" >> $HOME/.vimrc

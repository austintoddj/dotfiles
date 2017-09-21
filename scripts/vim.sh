#!/usr/bin/env bash

echo -e "Updating your Vim setup and configuration..."

cp -r .vim ~/.vim
[ -f ~/.vimrc ] && cp -rf .vimrc ~/.vimrc || cp .vimrc ~/.vimrc

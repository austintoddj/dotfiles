#!/usr/bin/env bash

echo -e "Updating your Bash setup and configuration..."

[ -f ~/.bashrc ] && cp -rf .bashrc ~/.bashrc || cp .bashrc ~/.bashrc
[ -f ~/.bash_profile ] && cp -rf .bash_profile ~/.bash_profile || cp .bash_profile ~/.bash_profile

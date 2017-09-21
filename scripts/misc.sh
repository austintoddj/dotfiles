#!/usr/bin/env bash

echo -e "Updating miscellaneous configurations..."

[ -f ~/.hushlogin ] && cp -rf .hushlogin ~/.hushlogin || cp .hushlogin ~/.hushlogin

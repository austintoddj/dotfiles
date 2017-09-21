#!/usr/bin/env bash

echo -e "Updating miscellaneous configuration files..."

[ -f ~/.hushlogin ] && cp -rf .hushlogin ~/.hushlogin || cp .hushlogin ~/.hushlogin

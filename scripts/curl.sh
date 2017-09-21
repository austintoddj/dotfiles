#!/usr/bin/env bash

echo -e "Updating your cURL configuration file..."

[ -f ~/.curlrc ] && cp -rf .curlrc ~/.curlrc || cp .curlrc ~/.curlrc

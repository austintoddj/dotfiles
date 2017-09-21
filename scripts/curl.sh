#!/usr/bin/env bash

echo -e "Updating your Curl configuration file..."

[ -f ~/.curlrc ] && cp -rf .curlrc ~/.curlrc || cp .curlrc ~/.curlrc

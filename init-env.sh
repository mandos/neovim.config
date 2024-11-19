#!/usr/bin/env bash

rm -rf .env

mkdir -p .env/{.config,.local,.cache}
mkdir -p .local/{share,state}

ln -s "$(pwd)" .env/.config/nvim

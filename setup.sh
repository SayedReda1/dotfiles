#!/bin/sh

# Installing GNU Stow
sudo apt update
sudo apt install stow -y

# Installing all packages with stow
stow .

#!/bin/bash

# Installing GNU Stow
if which stow
then
	echo "GNU stow is already installed"
else
	echo "Starting to install GNU stow"
	sudo apt update
	sudo apt install stow -y
fi

# Installing all packages with stow
echo "Starting to install packages: $@"
stow -t ~ -S "$@"

echo "DONE!"

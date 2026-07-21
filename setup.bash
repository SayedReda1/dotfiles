#!/usr/bin/bash

echo_colored() {
  echo -e "\033[32m$1\033[0m"
}

# Banner
cat <<-"EOF" | awk -v GREEN="\033[32m" -v RESET="\033[0m" '{ printf "%s%s%s\n", GREEN, $0, RESET }'

    ____                    ______            _____
   / __ \_      ______     / ____/___  ____  / __(_)_____
  / /_/ / | /| / / __ \   / /   / __ \/ __ \/ /_/ / __  /
 / ____/| |/ |/ / / / /  / /___/ /_/ / / / / __/ / /_/ / 
/_/     |__/|__/_/ /_/   \____/\____/_/ /_/_/ /_/\__, /  
                                                /____/   

EOF

# Update system repositories
echo_colored "󰚰 Updating system repositories..."
sudo apt update -y

if ! command -v "stow" >/dev/null 2>&1; then
  echo_colored " Installing GNU Stow..."
  sudo apt install stow -y
fi

if ! command -v "fzf" >/dev/null 2>&1; then
  echo_colored " Installing fzf..."
  sudo apt install fzf -y
fi

# Showing installation prompt
SELECTED_PACKAGES=$(
  find . -maxdepth 1 -mindepth 1 -type d ! -name '.*' -printf '%P\n' |
    fzf --multi --reverse --prompt "Select config packages [Tab to select]: "
)

# Installing all packages with stow
for config in $SELECTED_PACKAGES; do
  echo_colored " Applying '$config' config and installing all dependencies..."
  # Creating the symlinks
  stow -t ~ -D -S "$config"

  # Installing dependencies
  if [ -e ".install-dependencies/$config.sh" ]; then
    bash ".setup-scripts/$config.bash"
  fi

  echo_colored "󱋌 Package '$config' has been installed successfully."
done

echo_colored "󱜙 All Done"

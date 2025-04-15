#!/usr/bin/bash
# Installing GNU Stow
print_banner() {
    local text="$1"
    local width="$2"

    # Auto-adjust width if too small
    if (( ${#text} + 4 > width )); then
        width=$(( ${#text} + 4 ))
    fi

    local border=$(printf '%*s' "$width" '' | tr ' ' '=')
    local padding=$(( (width - ${#text} - 2) / 2 ))
    local extra_space=$(( (width - ${#text} - 2) % 2 ))

    local line="|"
    line+="$(printf '%*s' "$padding" '')$text"
    line+="$(printf '%*s' "$((padding + extra_space))" '')|"

    echo "$border"
    echo "$line"
    echo "$border"
}

print_banner "Installing Required Packages..." 40
if which stow > /dev/null
then
    echo "[*] GNU Stow: Installed Already"
else
    echo "[*] GNU Stow: Installing..."
    sudo apt update
    sudo apt install stow -y
fi

zsh_setup() {
    # installing ohmyzsh
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
    # installing p10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
}

# Installing all packages with stow
print_banner "Installing Dotfiles..." 40
for config in $@;
do
    print_banner "$config" 10
    if [[ $config = "zsh" ]];
    then
        zsh_setup
    fi

    stow -t ~ -S "$@"
done

echo "DONE!"

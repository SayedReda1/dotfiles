# ohmyzsh
if [ ! -e "$HOME/.oh-my-zsh" ]; then
  echo " Installing Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
  # p10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  # completions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo " Oh My Zsh Installed, Skipping Installation..."
fi

# Banner and it colors
if ! command -v "figlet" >/dev/null 2>&1; then
  echo " Installing figlet & lolcat for fancy banner :)"
  sudo apt install figlet lolcat
else
  echo " figlet & lolcat Installed, Skipping Installation..."
fi

# Eza
if ! command -v "eza" >/dev/null 2>&1; then
  echo " Installing 'eza' for happy listing :)"
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt update
  sudo apt install -y eza
else
  echo " eza Installed, Skipping Installation..."
fi

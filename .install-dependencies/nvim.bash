# Nerd Font
if ! fc-list | grep -qi "Nerd Font"; then
  echo " Installing JetBrains Nerd Font..."
  wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
  cd ~/.local/share/fonts
  unzip JetBrainsMono.zip
  rm JetBrainsMono.zip
  fc-cache -fv
  cd -
else
  echo "󰙡 Nerd Font already installed, Skipping installation..."
fi

# Tree-sitter CLI
if ! command -v "tree-sitter" >/dev/null 2>&1; then
  if ! command -v "cargo" >/dev/null 2>&1; then
    echo " Installing Rust toolchain (required for Tree-sitter CLI)..."
    curl https://sh.rustup.rs -sSf | sh
  fi
  echo " Installing Tree-sitter CLI..."
  cargo install --locked tree-sitter-cli
else
  echo "󰙡 Tree-sitter CLI already installed, Skipping installation..."
fi

if ! command -v "fzf" >/dev/null 2>&1; then
  echo " Installing fzf..."
  sudo apt install fzf -y
else
  echo "󰙡 fzf already installed, Skipping installation..."
fi

if ! command -v "rg" >/dev/null 2>&1; then
  echo " Installing ripgrep..."
  sudo apt install ripgrep -y
else
  echo "󰙡 ripgrep already installed, Skipping installation..."
fi

if ! command -v "fd" >/dev/null 2>&1; then
  echo " Installing fd-find..."
  apt install fd-find
else
  echo "󰙡 fd-find already installed, Skipping installation..."
fi

#!/bin/bash
echo "Setting up system."

read -p "Install dependencies?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  dependencies="python3 python3-pip npm xclip unzip"
  sudo apt update
  echo "Installing dependencies."
  sudo apt install $dependencies -y
fi

read -p "Install latest nvim?" -n 1 -r 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing nvim."

  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar xzf nvim-linux64.tar.gz
  echo 'alias nvim=/home/$USER/nvim-linux64/bin/nvim' >> ~/.bashrc
fi

read -p "Install NvChad?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && /home/$USER/nvim-linux64/bin/nvim
fi

read -p "Copy NvChad config from dotfiles?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  \cp -r dotfiles/.config .config/
fi

read -p "Install nvm?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
fi

read -p "Install and use latest node?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm install node
  nvm use node
fi

read -p "Install pyright?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo npm install -g pyright
fi

read -p "Install ruff?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  pip3 install ruff
fi

read -p "Install black?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  pip3 install black
fi


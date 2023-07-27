#!/bin/bash
echo "Setting up system."

read -p "Install dependencies?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  dependencies="python3 python3-pip npm xclip"
  echo "Installing dependencies."

  for package in $dependencies
  do
    installed=$(apt -qq list $package)
    if [[ -z "$installed" ]]; then
      sudo apt install $package -y
    fi
  done
fi

read -p "Install latest nvim?" -n 1 -r 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing nvim."

  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar xzf nvim-linux64.tar.gz
fi


echo 'Add nvim to path in .bashrc: export PATH=$PATH:~/home/$USER/nvim-linux64/bin'

read -p "Install NvChad?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
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
  nvm install node
  nvm use node
fi

read -p "Install pyright?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  npm install -g pyright
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


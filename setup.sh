echo "Setting up system."

dependencies="python3 python3-pip npm xclip"

echo "Installing dependencies."

for package in $dependencies
do
  installed=$(apt -qq list $package)
  if [[ -z "$installed" ]]; then
    echo "ran $package"
    sudo apt install $package -y
  fi
done

echo "Installing nvim."

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz

echo "Add nvim to path: export PATH=$PATH:~/home/$USER/nvim-linux64/bin"

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

\cp -r dotfiles/.config .config/

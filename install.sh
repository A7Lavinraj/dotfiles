echo "Environment setup installation start..."
echo "Need sudo previlages"
sudo echo "Password Accquired!"
echo -n "Homebrew installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.zshrc
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else 
  echo "Aborting the Homebrew installation"
fi

echo -n "Git installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  sudo apt install git
else 
  echo "Aborting the Git installation"
fi

echo -n "Node installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  sudo apt install node -y
  sudo pnpm install --global n
  sudo n lts
else 
  echo "Aborting the Node installation"
fi

echo -n "Compilers and interpreters installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  sudo apt install gcc g++ python3 ipython3 
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && rustup update
else 
  echo "Aborting the Compilers and interpreters installation"
fi

echo -n "Neovim installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  brew install neovim
  cp -r ./nvim/ ~/.config/nvim/
else 
  echo "Aborting the Neovim installation"
fi

echo -n "Alacritty installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  git clone git@github.com:alacritty/alacritty.git ~/alacritty/
  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
  cd ~/alacritty/
  cargo build --release --no-default-features --features=wayland
  mkdir -p ${ZDOTDIR:-~}/.zsh_functions
  echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
else 
  echo "Aborting the Alacritty installation"
fi

echo -n "TMUX and TPM installation need permission(y/n) "
read input

if [ "$input" = "y" ]; then
  brew install tmux
  cp ./.tmux.conf ~/.tmux.conf
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else 
  echo "Aborting the TMUX and TPM installation"
fi

echo "Environment setup complete successfully!"

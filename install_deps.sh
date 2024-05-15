#!/usr/bin/env bash

mkdir -p ~/manual-installs

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/manual-installs/powerlevel10k

# Install zsh-completions
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/manual-installs/zsh-autosuggestions

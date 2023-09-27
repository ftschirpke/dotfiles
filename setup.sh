cd $(dirname $0)

if [[ "$PWD" != "$HOME/.config/nvim" ]];
then
	echo "Error: Your Neovim config is not located at '~/.config/nvim'"
	exit 1
fi
echo "Your Neovim config is located at '~/.config/nvim'"

cd ~/.config/nvim

echo "--------------------------------------------------------------------------------------"
echo "Installing Neovim"
sudo snap install nvim --classic

echo "--------------------------------------------------------------------------------------"
echo "Cloning my package manager: 'packer.nvim'"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "--------------------------------------------------------------------------------------"
echo "Installing nodejs (required for Copilot)"
sudo apt-get remove nodejs -y
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

if [[ -f "$HOME/github_config.sh" ]];
then
	echo "--------------------------------------------------------------------------------------"
	echo "Configuring this as a GitHub repository using the existing '~/github_config.sh'"
	bash ~/github_config.sh
fi

echo "======================================================================================"
echo "REMEMBER:"
echo "the errors in the beginning are expected! just press 'q'"
echo "run ':PackerSync' to install neovim packages"
echo "run ':Copilot setup' to setup GitHub Copilot"
echo "restart neovim"
echo "run ':MasonToolsInstall' to install all the mason tools listed in 'after/plugin/lsp.lua'"
echo "                         after that you should have 16 mason tools installed"

echo "--------------------------------------------------------------------------------------"
echo "Install Neovim"
sudo snap install nvim --classic

echo "--------------------------------------------------------------------------------------"
echo "Cloning my package manager: 'packer.nvim'"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "--------------------------------------------------------------------------------------"
echo "Installing nodejs (required for Copilot)"
sudo snap install node --classic

echo "======================================================================================"
echo "REMEMBER:"
echo "run ':PackerSync' to install neovim packages"
echo "run ':Copilot setup' to setup GitHub Copilot"

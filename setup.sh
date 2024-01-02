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
echo "Installing ripgrep (required for Telescope)"
sudo apt-get install ripgrep -y

echo "--------------------------------------------------------------------------------------"
echo "Installing nodejs (required for Copilot)"
if [[ $(node -v) == v20* ]];
then
    echo "nodejs 20 is already installed"
else
    echo "nodejs 20 is not installed"
    sudo apt-get remove nodejs -y
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt-get update
    sudo apt-get install nodejs -y
fi

if [[ -f "$HOME/github_config.sh" ]];
then
	echo "--------------------------------------------------------------------------------------"
	echo "Configuring this as a GitHub repository using the existing '~/github_config.sh'"
	bash ~/github_config.sh
fi

echo "--------------------------------------------------------------------------------------"
echo "Creating symlinks for lsp configs"
for file in $(find lsp_configs -mindepth 1 -maxdepth 1 -type f -printf '%P\n'); do
    if [[ -f ~/.config/$file ]];
    then
        if [[ $(realpath ~/.config/$file) == $(realpath ~/.config/nvim/lsp_configs/$file) ]];
        then
            echo "File '~/.config/$file' is already a symlink to '~/.config/nvim/lsp_configs/$file'"
            continue
        else
            echo "Replacing existing file '~/.config/$file'"
            rm ~/.config/$file
            ln -s ~/.config/nvim/lsp_configs/$file ~/.config/$file
        fi
    else
        echo "Creating symlink '~/.config/$file'"
        ln -s ~/.config/nvim/lsp_configs/$file ~/.config/$file
    fi
done

echo "======================================================================================"
echo "REMEMBER:"
echo "the errors in the beginning are expected! just press 'q'"
echo "run ':Copilot setup' to setup GitHub Copilot"
echo "restart neovim"
echo "run ':MasonToolsInstall' to install all the mason tools listed in 'after/plugin/lsp.lua'"

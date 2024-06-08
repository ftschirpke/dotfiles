cd $(dirname $0)

if [[ "$PWD" != "$HOME/.config/nvim" ]];
then
	echo "Error: Your Neovim config is not located at '~/.config/nvim'"
	exit 1
fi
echo "Your Neovim config is located at '~/.config/nvim'"

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
echo "run ':Copilot setup' to setup GitHub Copilot"
echo "run ':MasonToolsInstall' to install all the mason tools listed in 'plugins/lsp.lua'"
echo "restart neovim"
echo "run ':checkhealth' to find everything you might have missed or is machine specific

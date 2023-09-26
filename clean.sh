cd $(dirname $0)

if [[ "$PWD" != "$HOME/.config/nvim" ]];
then
	echo "Error: Your Neovim config is not located at '~/.config/nvim'"
	exit 1
fi
echo "Your Neovim config is located at '~/.config/nvim'"

cd ~
sudo rm -rd ~/.local/share/nvim
sudo snap remove nvim
sudo rm -rd ~/.config/nvim

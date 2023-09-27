cd $(dirname $0)

if [[ "$PWD" != "$HOME/.config/tmux" ]];
then
	echo "Error: Your Neovim config is not located at '~/.config/tmux'"
	exit 1
fi
echo "Your Neovim config is located at '~/.config/tmux'"

cd ~
sudo rm -rd ~/.local/share/tmux
sudo rm -rd ~/.tmux
sudo rm -rd ~/.config/tmux

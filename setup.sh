cd $(dirname $0)

if [[ "$PWD" != "$HOME/.config/tmux" ]];
then
	echo "Error: Your Neovim config is not located at '~/.config/tmux'"
	exit 1
fi
echo "Your Neovim config is located at '~/.config/tmux'"

cd ~/.config/tmux

echo "--------------------------------------------------------------------------------------"
echo "Installing Tmux"
sudo apt install -y tmux

echo "--------------------------------------------------------------------------------------"
echo "Installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "--------------------------------------------------------------------------------------"
echo "Installing fzf for fuzzy finding"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

if [[ -f "$HOME/github_config.sh" ]];
then
	echo "--------------------------------------------------------------------------------------"
	echo "Configuring this as a GitHub repository using the existing '~/github_config.sh'"
	bash ~/github_config.sh
fi

echo "======================================================================================"
echo "REMEMBER:"
echo "add ~/.config/tmux/scripts to your PATH"


#!/bin/bash

function prompt
{
	printf "$@? [Y/n] "
	read -r choice
	if [[ ! $choice =~ n|N ]]; then
		return 0
	else
		return 1
	fi
}

function ask_install 
{
	if prompt install $1; then
		if [[ $# -gt 1 ]]; then
			sudo apt-get install -y ${@:2}
		else
			sudo apt-get install -y $1
		fi
		return 0
	fi
	return 1
}

# Always install
sudo apt-get install git curl vim
# Misc
ask_install nmap
ask_install ruby
ask_install r-base
ask_install openssh-server
ask_install nodejs
ask_install mysql
# Trash-cli
if prompt install trash-cli; then
	easy_install trash-cli
fi
# Game stuff
ask_install game-stuff zsnes joy2key joystick
if !(($?)); then
	wget -P $HOME https://gist.githubusercontent.com/entrity/a58c12427a84e1dad63f632cebda947e/raw/5ac15e1a06d51a0855195e55e56bde77f55776fc/.joy2keyrc
fi
# Gitconfig
wget -P $HOME https://gist.github.com/entrity/5462105/raw/6b0e0b02d4af4f1f8d3291dc8987b5f317d57bd4/.gitconfig
# Bash aliases
wget -P $HOME https://gist.github.com/entrity/5462105/raw/6b0e0b02d4af4f1f8d3291dc8987b5f317d57bd4/.bash_aliases
if ! grep -q bash_aliases $HOME/.bashrc; then
	echo '[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases' >> $HOME/.bashrc
fi
# SSH config
wget -P $HOME/.ssh -O config https://gist.github.com/entrity/5462105/raw/97878c05568e4a1feb34664b1a0d6a6820176fe6/ssh-config

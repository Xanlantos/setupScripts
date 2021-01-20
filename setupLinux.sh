install()
{
	sudo apt update
	sudo apt upgrade
	sudo apt install curl wget git
	sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
	sudo apt install vim
	sudo apt install bat
	sudo apt install exa
	#oh-my-zsh
	sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	#powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo "Seting ZSH_THEME=\"powerlevel10k/powerlevel10k\" in ~/.zshrc."
  echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" > ~/.zshrc
	#exa
	wget http://archive.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
	sudo apt-get install ./exa_0.9.0-4_amd64.deb



}

main()
{
	install
	echo "run 'source ~/.zshrc' to reload zsh config" #reload zshrc
}

main

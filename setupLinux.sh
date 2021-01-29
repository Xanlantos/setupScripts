#!/bin/sh
main() {
  install
}
install() {
  basicSetup
  installP10k
  echo "run 'source ~/.zshrc' to reload zsh config" #reload zshrc
}
installP10k(){
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || echo "already loaded p10k"
    # copy configs
    cp setupScripts/.p10k.zsh ~/.p10k.zsh
    cp setupScripts/.zshrc ~/.zshrc
}
basicSetup() {
  sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove
  sudo apt -y install curl wget git
  sudo apt -y install vim bat
  sudo apt -y install zsh zsh-autosuggestions zsh-syntax-highlighting
  updateGit
  installExa
  addAliases
  installOhMyZSH
}
updateGit() { #only works with second call TODO
  cd setupScripts/
  git pull
  cd -
}
installOhMyZSH() {
  [[ $ZSH ]] && echo "$ZSH exists. skip ZSH installation" || sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}
installExa() {
  wget http://archive.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
  sudo apt -y install ./exa_0.9.0-4_amd64.deb
  rm exa_0.9.0-4_amd64.deb
}
addAliases() {
  rm -f ~/aliases.zshrc #TODO override?
  cp ~/setupScripts/aliases.zshrc ~/aliases.zshrc
}
main

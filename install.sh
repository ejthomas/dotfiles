#!/usr/bin/env bash

# Install required packages
sudo apt update
sudo apt install -y zsh
sudo apt install -y zsh-syntax-highlighting

# Set zsh as preferred shell
chsh -s $(which zsh)

# Install oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install oh-my-zsh extensions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Git LFS
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install -y git-lfs
git lfs install

# Replace existing dotfiles

# zsh
if [[ -f $HOME/.zshrc ]]; then
    cp $HOME/.zshrc $HOME/.zshrc.pre-dotfiles.$(date "+%Y%m%d_%H%M%S") && rm $HOME/.zshrc
fi
cp common/.zshrc $HOME/.zshrc

# vim
if [[ -f $HOME/.vimrc ]]; then
    cp $HOME/.vimrc $HOME/.vimrc.pre-dotfiles.$(date "+%Y%m%d_%H%M%S") && rm $HOME/.vimrc
fi
cp common/.vimrc $HOME/.vimrc

# p10k
if [[ -f $HOME/.p10k.zsh ]]; then
    cp $HOME/.p10k.zsh $HOME/.p10k.zsh.pre-dotfiles.$(date "+%Y%m%d_%H%M%S") && rm $HOME/.p10k.zsh
fi
cp common/.p10k.zsh $HOME/.p10k.zsh

#!/bin/bash


function init() {
    . /etc/os-release
    if [ -z ${UBUNTU_CODENAME} ]; then
        echo "This script is only for Ubuntu"
        exit 1
    fi

    sudo apt update
    sudo apt install -y ca-certificates gpg wget
}

function install_latest_cmake() {
    if [ ! -f /usr/share/doc/kitware-archive-keyring/copyright ]; then
        wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null \
        | gpg --dearmor - \
        | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
    fi

    echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg]" \
         "https://apt.kitware.com/ubuntu/ ${UBUNTU_CODENAME} main" \
    | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
    sudo apt update

    if [ ! -f /usr/share/doc/kitware-archive-keyring/copyright ]; then
        sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
    fi
    sudo apt install -y kitware-archive-keyring

    sudo apt install -y cmake
}

function install_latest_git() {
    sudo apt-add-repository -y ppa:git-core/ppa
    sudo apt update
    sudo apt install -y git
}

function install_zsh() {
    sudo apt install -y zsh

}

function configure_zsh() {
    sudo chsh "$USER" -s /usr/bin/zsh

    # install zim
    wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    # install zoxide
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

    cp ./dotfiles/.zshrc ${HOME}/.zshrc
    cp ./dotfiles/.zimrc ${HOME}/.zimrc
    cp ./dotfiles/.p10k.zsh ${HOME}/.p10k.zsh
    cp -r ./dotfiles/.zshenv ${HOME}/.zshenv
    cp -r ./dotfiles/.zsh ${HOME}/.zsh
}

function configure_git() {
    cp ./dotfiles/.gitconfig ${HOME}/.gitconfig
}

function configure_vim() {
    cp ./dotfiles/.vimrc ${HOME}/.vimrc
}

init

install_latest_cmake
install_latest_git
install_zsh

configure_zsh
configure_git
configure_vim
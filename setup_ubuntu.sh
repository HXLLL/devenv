#!/bin/bash


function init() {
    . /etc/os-release
    if [ -z ${UBUNTU_CODENAME} ]; then
        echo "This script is only for Ubuntu"
        exit 1
    fi

    sudo apt update
    sudo apt install -y ca-certificates gpg wget curl pkg-config python3-pip
    if [[ ${UBUNTU_CODENAME} == "noble" ]]; then
        sudo apt install -y python3-mesonpy
    else
        sudo pip install meson ninja
    fi
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

function configure_c() {
    install_latest_gcc
    sudo apt install clang-format
}

function install_latest_gcc() {
    if [ ${UBUNTU_CODENAME} == "noble" ]; then
        sudo apt install -y gcc-14
    else
        echo "unsupported distribution"
    fi
}

function install_zsh() {
    sudo apt install -y zsh
}

function configure_zsh() {
    sudo chsh $USER -s /usr/bin/zsh

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

function configure_all() {
    CONFIGURE_CMAKE=1
    CONFIGURE_GIT=1
    CONFIGURE_VIM=1
    CONFIGURE_ZSH=1
    CONFIGURE_GCC=1
}

CONFIGURE_CMAKE=0
CONFIGURE_GIT=0
CONFIGURE_VIM=0
CONFIGURE_ZSH=0
CONFIGURE_GCC=0

while [[ $# -gt 0 ]]; do
    case $1 in 
	all)
            configure_all
	    shift
	    ;;
        cmake)
            CONFIGURE_CMAKE=1
            shift
            ;;
        git)
            CONFIGURE_GIT=1
            shift
            ;;
        vim)
            CONFIGURE_VIM=1
            shift
            ;;
        zsh)
            CONFIGURE_ZSH=1
            shift
            ;;
        gcc)
            CONFIGURE_GCC=1
            shift
            ;;
        *)
            shift
            ;;
    esac
done

init

if [ ${CONFIGURE_CMAKE} -eq 1 ]; then
    install_latest_cmake
fi

if [ ${CONFIGURE_GIT} -eq 1 ]; then
    install_latest_git
    configure_git
fi

if [ ${CONFIGURE_VIM} -eq 1 ]; then
    configure_vim
fi

if [ ${CONFIGURE_ZSH} -eq 1 ]; then
    install_zsh
    configure_zsh
fi

if [ ${CONFIGURE_GCC} -eq 1 ]; then
    install_latest_gcc
fi

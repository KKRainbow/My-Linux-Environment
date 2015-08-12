#!/usr/bin/env zsh

source ./common.sh


install_ohmyzsh()
{
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}

install_composer()
{
	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
}

install_ss5()
{
    sudo add-apt-repository ppa:hzwhuang/ss-qt5
    sudo apt-get update
    sudo apt-get install shadowsocks-qt5
}

install_wine()
{
    sudo add-apt-repository ppa:ubuntu-wine/ppa
    sudo apt-get update
    sudo apt-get install wine1.7 -y
}
config_apache()
{
}

base=("build-essential" "curl" "git" "cmake" "g++" "vim" "qemu-system-i386" "meld" "svn" "zsh" "apache2" "nfs-common" "mysql-client" "mysql-server-5.6" "php5" "kdevelop" "wget" "xorriso" "qemu-kvm" "virt-manager" "ctags")


php=("php5" "php5-mcrypt" "php5-curl" "php5-cli" "php5-mysql" "php5-dev")

install $base
install $php
install_ohmyzsh
install_composer
install_ss5

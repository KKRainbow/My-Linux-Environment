#!/usr/bin/env zsh

source ./common.sh

install()
{
	local p
	for i in $*
	do
		echo "正在安装"${i}
		sudo apt-get install $i -y -qq
	done
}

install_ohmyzsh()
{
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}

base=("build-essential" "curl" "git" "cmake" "g++" "vim" "qemu-system-i386" "meld" "svn" "zsh" "apache2" "nfs-common" "mysql-client" 
"mysql-server-5.6" "php5")


php=("php5" "php5-mcrypt" "php5-curl" "php5-cli" "php5-mysql")

install $base
install $php
install_ohmyzsh

#!/usr/bin/env zsh

install_url="http://ghaffarian.net/downloads/Java/JDK/jdk-8u45-linux-x64.tar.gz"
install_dir="/opt/java"
tmp_dir="/tmp/java/"
tmp_filename=`basename $install_url`
tmp_path=$tmp_dir$tmp_filename

#添加java环境变量
count=`grep -c JAVA_HOME /etc/profile`
if [ $count -gt "0" ];then
	echo "JAVA环境变量已存在,请删除后重新尝试"
	exit
fi

sudo mkdir -p $install_dir
sudo mkdir -p $tmp_dir

echo "选择是否重新下载Jdk:(y/n)"
ans=`read -E`

if [ ! -f $tmp_path ] && [ `ls $tmp_dir|grep -c jdk` -eq 0 ] && [ $ans -eq "y" ];then
	echo "正在下载JDK"
	sudo curl $install_url -L > $tmp_path
fi

if [ ! $? -eq 0 ]; then
	echo "下载失败,请重试"
	exit
fi

tmp_path=`ls $tmp_dir`
(cd $tmp_dir;sudo tar -xzvf $tmp_path;tmp_path=`find -maxdepth 1 -type d -name "jdk*"`;echo $tmp_path;sudo cp $tmp_path $install_dir/ -r)

java_home=`find $install_dir -name "jdk*" -type d -nowarn -maxdepth 2`
echo "Java Home被配置为"$java_home
jre_home=`find $install_dir -name "jre" -type d -nowarn -maxdepth 4`
echo "Jre Home被配置为"$jre_home
echo "classpath 被配置为\$JAVA_HOME=.:\$JAVA_HOME/lib:\$JRE_HOME/lib:\$CLASSPATH"

envs="""
JAVA_HOME=$java_home
JRE_HOME=$jre_home
CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib:\$CLASSPATH
PATH=\$JAVA_HOME/bin:\$JRE_HOME/bin:\$PATH
export JAVA_HOME
export JRE_HOME
export CLASSPATH
export PATH
"""

sudo chmod a+w /etc/profile
echo $envs >> /etc/profile
sudo chmod 644 /etc/profile

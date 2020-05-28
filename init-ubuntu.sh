#!/bin/bash

set -v on
set -u
set -e

cd $(dirname "$0")

sudo cp -f ./sources.list /etc/apt/sources.list

sudo apt remove -y libreoffice*
sudo apt remove -y thunderbird aisleriot gnome-mines gnome-sudoku rhythmbox gnome-mahjongg 
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

sudo apt install -y git vim g++ curl mpv python3-pip p7zip-full p7zip-rar ninja-build gnome-shell-extension-top-icons-plus

# install wps (https://linux.wps.cn/)
if [ ! -f ./wps-office.deb ]; then
    wget -O wps-office.deb https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/9505/wps-office_11.1.0.9505_amd64.deb
fi
sudo apt install -y ./wps-office.deb

# install deepin-wine-ubuntu (https://github.com/wszqkzqk/deepin-wine-ubuntu)
if [ ! -d deepin-wine-for-ubuntu ]; then 
    git clone --depth=1 https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git
fi
cd deepin-wine-for-ubuntu
./install.sh
cd ..

# install TIM
if [ ! -f ./deepin.com.qq.office.deb ]; then
    wget -O deepin.com.qq.office.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_2.0.0deepin4_i386.deb
fi
sudo apt install -y ./deepin.com.qq.office.deb

# install WeChat
if [ ! -f ./deepin.com.wechat.deb ]; then
    wget -O deepin.com.wechat.deb https://mirror.glavo.site/deepin/deepin.com.wechat_2.6.8.65deepin0_i386.deb
fi
sudo apt install -y ./deepin.com.wechat.deb

# install vscodium (https://vscodium.com/)
if [ ! -f /etc/apt/sources.list.d/vscodium.list ]; then
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
    echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
fi
sudo apt update && sudo apt install -y codium

# install typora (https://typora.io/#linux)
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update && sudo apt install -y typora


# install Liberica JDK 11 (https://bell-sw.com/pages/java-11/)
LIBERICA_JDK_VERSION="11.0.6+10"
if [ ! -f ./bellsoft-jdk.deb ]; then
    wget -O bellsoft-jdk.deb http://download.bell-sw.com/java/${LIBERICA_JDK_VERSION}/bellsoft-jdk${LIBERICA_JDK_VERSION}-linux-amd64-full.deb
fi
sudo dpkg -i ./bellsoft-jdk.deb

# install CMake (https://apt.kitware.com/)
CMAKE_VERSION="3.17.2-0kitware1"
if [ ! -f ./cmake-data.deb ]; then
    wget -O cmake-data.deb "https://apt.kitware.com/ubuntu/pool/main/c/cmake/cmake-data_${CMAKE_VERSION}_all.deb"
fi
if [ ! -f ./cmake.deb ]; then
    wget -O cmake.deb "https://apt.kitware.com/ubuntu/pool/main/c/cmake/cmake_${CMAKE_VERSION}_amd64.deb"
fi
sudo dpkg -i ./cmake-data.deb
sudo dpkg -i ./cmake.deb

# install Gradle (https://gradle.org/releases/)
GRALDE_VERSION="6.4.1"
if [ ! -f /usr/bin/gradle ]; then
    if [ ! -f ./gradle.zip ]; then
        wget -O gradle.zip "https://services.gradle.org/distributions/gradle-${GRALDE_VERSION}-all.zip"
    fi
    sudo unzip -d /opt gradle.zip
    sudo update-alternatives --install /usr/bin/gradle gradle "/opt/gradle-${GRALDE_VERSION}/bin/gradle" 10
fi

# install Maven (https://maven.apache.org/download.cgi)
MAVEN_VERSION="3.6.3"
if [ ! -f /usr/bin/mvn ]; then
    if [ ! -f ./maven.zip ]; then
        wget -O maven.zip "https://maven.aliyun.com/repository/public/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.zip"
    fi
    sudo unzip -d /opt maven.zip
    sudo update-alternatives --install /usr/bin/mvn mvn "/opt/apache-maven-${MAVEN_VERSION}/bin/mvn" 10
    sudo update-alternatives --install /usr/bin/mvnDebug mvnDebug "/opt/apache-maven-${MAVEN_VERSION}/bin/mvnDebug" 10
fi

# install netease-cloud-music (https://music.163.com/#/download)
if [ ! -f ./netease-cloud-music.deb ]; then
    wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
fi
sudo dpkg -i ./netease-cloud-music.deb

# install Docker (https://docs.docker.com/engine/install/ubuntu/)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

#!/bin/bash
# Author: Zhifeng JIANG from HKUST
# Reference: https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/

wget https://webank-ai-1251170195.cos.ap-guangzhou.myqcloud.com/jdk-8u192-linux-x64.tar.gz
sudo mkdir -p $HOME/jvm/
sudo tar xzf jdk-8u192-linux-x64.tar.gz -C $HOME/jvm/
JAVA_HOME=$HOME/jvm/jdk1.8.0_192/
sudo update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
sudo update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000

wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz -P $HOME
sudo tar xf $HOME/apache-maven-*.tar.gz -C $HOME
sudo ln -s $HOME/apache-maven-3.6.3 $HOME/maven

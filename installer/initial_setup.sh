#!/bin/sh
#
########################################################################
# Initial Setup Script for Ubuntu/Debian
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
# v1.15 5/13,2009
#       Add ubuntu-ja, OpenOffice.org, codec, icons.
#       Setting reserved blocks percentage of ext3 filesystem to 1%.
# v1.14 4/29,2009
#       Add GNU GLOBAL.
# v1.13 3/11,2009
#       Disable local build vim.
# v1.12 1/19,2009
#       Add monitoring tools.
# v1.11 1/18,2009
#       Update to truecrypt 6.1a.
# v1.10 12/31,2008
#       Add emacs-w3m.
#  v1.9 12/26,2008
#       Add paco.
#  v1.8 12/11,2008
#       Add Bitstream Vera Sans Mono, set emacs default, purge vim-gnome.
#  v1.7 11/06,2008
#       Change root shell from zsh to bash.
#  v1.6 10/30,2008
#       Emacs snapshot as default.
#  v1.5 10/24,2008
#       Add sysstat.
#  v1.4 10/14,2008
#       Splash various problems of initial setup and set debian as default.
#  v1.3 9/25,2008
#       Auto tune2fs when using LVM.
#  v1.2 9/23,2008
#       Add curl.
#  v1.1 8/14,2008
#       Automatic Install for gpg,browser,iptable,trac,passenger,
#       and Install Xfce4.
#  v1.0 5/12,2008
#       Stable, for Ubuntu Hardy.
#  v0.6 4/17,2008
#       Remove samba, adding sshfs.
#  v0.5 1/28,2008
#       Last setup added.
#  v0.4 11/23,2007
#       PostgreSQL added.
#  v0.3 10/16,2007
#       Save source code.
#  v0.2 9/4,2007
#       Add Optional Application Install.
#  v0.1 8/27,2007
#       First version.
########################################################################

export SCRIPTS=$HOME/scripts

# Groups
sudo groupadd admin
sudo groupadd wheel

# Show Memory and CPU
cat /proc/meminfo
cat /proc/cpuinfo

# Stop Services
sudo update-rc.d -f cupsys remove
sudo update-rc.d -f hplip remove
sudo apt-get remove apt-index-watcher

# APT Update
DISTRIB_CODENAME=lenny
SOURCESLIST=sources-$DISTRIB_CODENAME.list
sudo cp $SCRIPTS/etc/$SOURCESLIST /etc/apt/sources.list
sudo vim /etc/apt/sources.list
sudo aptitude update

# Ubuntu-ja GPG Automatic Import
#eval `cat /etc/lsb-release`
#wget -q http://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
#sudo wget http://www.ubuntulinux.jp/sources.list.d/$DISTRIB_CODENAME.list -O /etc/apt/sources.list.d/ubuntu-ja.list
#sudo aptitude update

# Make Directory
mkdir ~/.tmp
mkdir ~/.screen
mkdir ~/tmp
mkdir ~/etc
mkdir ~/bin
mkdir ~/arc
mkdir ~/mnt
mkdir ~/var
mkdir ~/local
chmod 700 ~/.tmp
chmod 700 ~/.screen
chmod 700 ~/tmp
chmod 700 ~/etc
chmod 700 ~/bin
chmod 700 ~/arc
chmod 700 ~/mnt
chmod 700 ~/var
chmod 700 ~/local
sudo mkdir /root/.tmp
sudo mkdir /root/.screen
sudo mkdir /root/tmp
sudo mkdir /root/etc
sudo mkdir /root/bin
sudo mkdir /root/arc
sudo mkdir /root/mnt
sudo mkdir /root/var
sudo mkdir /root/local
sudo chmod 700 /root/.tmp
sudo chmod 700 /root/.screen
sudo chmod 700 /root/tmp
sudo chmod 700 /root/etc
sudo chmod 700 /root/bin
sudo chmod 700 /root/arc
sudo chmod 700 /root/mnt
sudo chmod 700 /root/var
sudo chmod 700 /root/local
sudo chmod 750 /root
sudo mkdir /etc/skel/.tmp
sudo mkdir /etc/skel/.screen
sudo mkdir /etc/skel/tmp
sudo mkdir /etc/skel/etc
sudo mkdir /etc/skel/bin
sudo mkdir /etc/skel/arc
sudo mkdir /etc/skel/mnt
sudo mkdir /etc/skel/var
sudo mkdir /etc/skel/local
sudo chmod 700 /etc/skel/.tmp
sudo chmod 700 /etc/skel/.screen
sudo chmod 700 /etc/skel/tmp
sudo chmod 700 /etc/skel/etc
sudo chmod 700 /etc/skel/bin
sudo chmod 700 /etc/skel/arc
sudo chmod 700 /etc/skel/mnt
sudo chmod 700 /etc/skel/var
sudo chmod 700 /etc/skel/local
sudo chmod 750 /home/*

# SSH, Compiler, Shell etc..
sudo aptitude -y install openssh-server
sudo aptitude -y install ssh
sudo aptitude -y install build-essential
sudo aptitude -y install gcc g++ g77
sudo aptitude -y install p7zip p7zip-full p7zip-rar
sudo aptitude -y install tar zip gzip unzip bzip2
sudo aptitude -y install lha-sjis
sudo aptitude -y install zsh
chsh -s /bin/zsh
sudo chsh -s /bin/bash root
sudo aptitude -y install screen

# Libraries and Programming Tools
sudo aptitude -y install ntp
sudo aptitude -y install uim uim-anthy uim-el
sudo aptitude -y install xfonts-mplus
sudo aptitude -y install xfonts-shinonome
sudo aptitude -y install ncftp
sudo aptitude -y install lynx
sudo aptitude -y install w3m
sudo aptitude -y install nasm
sudo aptitude -y install gauche
sudo aptitude -y install qemu
sudo aptitude -y install apt-file
sudo aptitude -y install apt-spy
sudo aptitude -y install keychain
sudo aptitude -y install locales
sudo aptitude -y install anacron
sudo aptitude -y install mailx
sudo aptitude -y install linux-source
sudo aptitude -y install checkinstall
sudo aptitude -y install xdelta
sudo aptitude -y install alien
sudo aptitude -y install curl
sudo aptitude -y install global

# SCM Client
sudo aptitude -y install subversion
sudo aptitude -y install git-core git-cvs git-svn git-email
sudo aptitude -y install svk

# sshfs
sudo aptitude -y install sshfs
sudo vim /etc/modules

# Samba (Not Recommended)
#sudo aptitude -y install samba smbfs smbclient swat
#sudo update-rc.d -f samba remove
#sudo cp $SCRIPTS/etc/smb.conf /etc/samba/smb.conf
#sudo smbpasswd -a $USER

# SQLite
sudo aptitude -y install sqlite
sudo aptitude -y install sqlite3

# PostgreSQL
sudo aptitude -y install postgresql postgresql-common postgresql-client
#sudo aptitude -y install pgadmin3

# MySQL
sudo aptitude -y install mysql-server mysql-client
#sudo aptitude -y install mysql-gui-tools-common
$SCRIPTS/installer/install_mysql.sh

# Text Editor
sudo aptitude -y install emacs-snapshot emacs-snapshot-el
sudo update-alternatives --config emacs
sudo aptitude -y install w3m-el-snapshot w3m-img imagemagick
sudo aptitude -y install vim-gui-common vim-runtime colordiff
sudo aptitude -y install ctags

# Bitstream Vera Sans Mono font(for Emacs)
sudo aptitude -y install ttf-vlgothic ttf-bitstream-vera

# Deploy dot_emacs
$SCRIPTS/installer/install_dotemacs.sh

# paco
$SCRIPTS/installer/install_paco.sh

# Vim (Original Build)
#$SCRIPTS/installer/install_ncurses.sh
#$SCRIPTS/installer/install_vim.sh

# Deploy dot_vim
$SCRIPTS/installer/install_dotvim.sh

# Deploy dot_files
$SCRIPTS/installer/install_dotfiles.sh

# Ruby
sudo aptitude -y install autoconf byacc bison autoconf-doc automake
sudo aptitude -y install libopenssl-ruby
sudo aptitude -y install ruby1.8 ruby1.8-dev rubygems
$SCRIPTS/installer/install_ruby.sh 187-svn

# Apache
sudo aptitude -y install apache2
sudo aptitude -y install apache2-mpm-prefork
sudo aptitude -y install apache-perl

# Apache Utility
sudo aptitude -y install apache2-utils

# Python Framework
vim $SCRIPTS/installer/install_python_framework.sh
$SCRIPTS/installer/install_python_framework.sh

# Sun Java JDK
sudo aptitude install -y sun-java6-jdk

# GDM Themes
#$SCRIPTS/installer/install_gdmthemes.sh
#$SCRIPTS/installer/install_gdmthemes2.sh

# gthumb
#sudo aptitude -y install gthumb

# Iceweasel and Icedove (Debian)
#$SCRIPTS/installer/install_iceweasel.sh

# Mozilla Thunderbird (Ubuntu)
#sudo aptitude -y install mozilla-thunderbird

# Opera (need apt-line)
#GPG_PUBKEY=033431536A423791
#gpg --keyserver pgp.nic.ad.jp --recv-keys $GPG_PUBKEY
#sudo gpg --armor --export $GPG_PUBKEY | sudo apt-key add -
#sudo aptitude update
#sudo aptitude install -y opera

# Xfce4(Debian) / Xubuntu(Ubuntu)
#sudo apt-get install xfce4
#sudo apt-get install xubuntu-desktop
#sudo aptitude -y install xfce4-goodies
#im-switch -c
#sudo rmmod pcspkr
#sudo vim /etc/modprobe.d/blacklist
#$SCRIPTS/installer/install_dotfiles.sh dot_xmodmaprc_hhklite2

# Ubuntu-ja
#sudo aptitude install -y ubuntu-desktop-ja

# OpenOffice.org
#sudo aptitude install -y openoffice.org

# Codec
#sudo aptitude install -y ubuntu-restricted-extras
#sudo aptitude install -y xubuntu-restricted-extras

# Icons
#sudo aptitude install -y human-icon-theme
#sudo aptitude install -y gnome-themes gnome-themes-extras

# 2ch Browser
#sudo aptitude -y install ochusha
#sudo aptitude -y install jd

# Comic Viewer
#sudo aptitude -y install comix

# CD/DVD Creator
#sudo aptitude -y install gnomebaker

# P2P
#sudo aptitude -y install skype

# MSN
#sudo aptitude -y install amsn

# Wireshark
#sudo aptitude -y install wireshark

# Optional Libraries
sudo aptitude -y install migemo
sudo aptitude -y install gnuserv
sudo aptitude -y install mingw32 mingw32-binutils mingw32-runtime
sudo aptitude -y install libxml2 libxml2-dev
sudo aptitude -y install expat libexpat-dev
sudo aptitude -y install libssl-dev libio-socket-ssl-perl libnet-ssleay-perl
sudo aptitude -y install libtemplate-perl libxml-libxml-perl
sudo aptitude -y install ghc

# Share Documents
#wget http://big.freett.com/railsinstall2/share-documents.tar.gz
#sudo tar xzvf share-documents.tar.gz -C /usr/local/share
#rm share-documents.tar.gz
#sudo chmod -R 755 /usr/local/share/share-documents
#ln -s /usr/local/share/share-documents ~/share

# Crypt
$SCRIPTS/installer/install_crypt.sh 6.1a-ubuntu-x86

# Security (Anti-Virus)
sudo aptitude -y install clamav avscan
sudo useradd clamav
#$SCRIPTS/installer/install_clamav.sh

# iptables
$SCRIPTS/installer/install_iptables.sh

# Trac
$SCRIPTS/installer/install_trac.sh

# RubyGems
$SCRIPTS/installer/install_rubygems.sh
$SCRIPTS/installer/install_gems.sh
$SCRIPTS/installer/install_rails.sh 212
#$SCRIPTS/installer/install_rails.sh 205
#$SCRIPTS/installer/install_rails.sh 126
vim-ruby-install.rb

# Passenger
$SCRIPTS/installer/install_passenger.sh

# ManPages
sudo aptitude -y install manpages-ja
sudo aptitude -y install manpages-ja-dev
sudo aptitude -y install xmanpages-ja

# Permissions for /src
sudo chown -R root:root /usr/src
sudo chown -R root:root /usr/local/src

# tune2fs
test -b /dev/sda5  && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda5
test -b /dev/sda6  && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda6
test -b /dev/sda7  && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda7
test -b /dev/sda8  && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda8
test -b /dev/sda9  && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda9
test -b /dev/sda10 && sudo tune2fs -i 0 -c 0 -m 1 /dev/sda10
test -b /dev/mapper/`/bin/hostname`-root && sudo tune2fs -i 0 -c 0 -m 1 /dev/mapper/`/bin/hostname`-root
test -b /dev/mapper/`/bin/hostname`-tmp  && sudo tune2fs -i 0 -c 0 -m 1 /dev/mapper/`/bin/hostname`-tmp
test -b /dev/mapper/`/bin/hostname`-var  && sudo tune2fs -i 0 -c 0 -m 1 /dev/mapper/`/bin/hostname`-var
test -b /dev/mapper/`/bin/hostname`-usr  && sudo tune2fs -i 0 -c 0 -m 1 /dev/mapper/`/bin/hostname`-usr
test -b /dev/mapper/`/bin/hostname`-home && sudo tune2fs -i 0 -c 0 -m 1 /dev/mapper/`/bin/hostname`-home

# Linux kernel source, headers, kbuild (Debian)
#sudo aptitude install linux-kbuild-2.6.26 linux-headers-2.6.26-1-686 linux-source-2.6.26

# Monitoring Tools
# sysstat
sudo aptitude -y install sysstat
sudo dpkg-reconfigure sysstat
# ENABLED="true"
sudo vim /etc/default/sysstat
# hddtemp
sudo aptitude -y install lm-sensors
sudo aptitude -y install hddtemp
sudo dpkg-reconfigure hddtemp
# smartmontools
sudo aptitude -y install smartmontools
# start_smartd=yes
# smartd_opts="--interval=7200"
sudo vim /etc/default/smartmontools
# smartmontools
sudo aptitude -y install ext2resize

# Last Setup
sudo dpkg-reconfigure exim4-config
sudo vim /etc/anacrontab
# PermitRootLogin yes->no
sudo vim /etc/ssh/sshd_config
# server 130.69.251.23
sudo vim /etc/ntp.conf
sudo vim /etc/fstab
sudo vim /etc/deluser.conf
sudo vim /etc/hosts
# ServerName, charset
test -f /etc/apache2/apache2.conf && sudo vim /etc/apache2/apache2.conf
sudo vim /etc/group
# /var/log/cron.log
sudo vim /etc/syslog.conf
# SYSLOGD="-m 0"
sudo vim /etc/default/syslogd
sudo vim /boot/grub/menu.lst
sudo passwd root
mysql -u root
test -f ~/.bash_history && sudo rm ~/.bash_history
test -f ~/.mysql_history && sudo rm ~/.mysql_history
test -f ~/.viminfo && sudo rm ~/.viminfo


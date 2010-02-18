#!/bin/sh
#
########################################################################
# Install Vim
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v1.3 2/18,2010
#       Add prefix syntax.
#  v1.2 3/10,2009
#       Switch wget to curl.
#  v1.1 10/3,2008
#       Implement local build from source.
#  v1.0 8/15,2008
#       Stable.
########################################################################

build_and_install() {
    test -d /usr/local/src/vim && sudo rm -rf /usr/local/src/vim
    test -d /usr/local/src/vim || sudo mkdir -p /usr/local/src/vim
    sudo cp vim-7.2.tar.bz2 /usr/local/src/vim
    sudo cp vim-7.2-extra.tar.gz /usr/local/src/vim
    sudo cp vim-7.2-lang.tar.gz /usr/local/src/vim
    sudo cp -a vim72 /usr/local/src/vim
    sudo cp -a patches /usr/local/src/vim
    cd vim72
    cat ../patches/7.2.* | patch -p0
    test -n "$1" || ./configure $PREFIX=
    test -n "$1" && ./configure $PREFIX=--prefix $1
    ./configure $PREFIX --enable-multibyte --enable-xim --enable-fontset --with-features=big --enable-perlinterp --enable-rubyinterp --enable-pythoninterp
    make
    sudo make install
}

get_source_and_install() {
    curl -O ftp://ftp.vim.org/pub/vim/unix/vim-7.2.tar.bz2
    curl -O ftp://ftp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz
    curl -O ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz
    tar xjvf vim-7.2.tar.bz2
    tar xzvf vim-7.2-extra.tar.gz
    tar xzvf vim-7.2-lang.tar.gz
    mkdir patches
    cd patches
    curl -O ftp://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz
    gunzip 7.2.001-100.gz
    curl -O ftp://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz
    gunzip 7.2.101-200.gz
    curl -O ftp://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz
    gunzip 7.2.201-300.gz
    curl -O 'ftp://ftp.vim.org/pub/vim/patches/7.2/7.2.[301-367]'
    cd ../
    build_and_install
    cd ../../
}

mkdir install_vim
cd install_vim
get_source_and_install $1
rm -rf install_vim

case $OSTYPE in
  *darwin*)
    sudo chown -R root:wheel /usr/local/src/vim
    ;;
  *)
    sudo chown -R root:root /usr/local/src/vim
    ;;
esac

vim --version

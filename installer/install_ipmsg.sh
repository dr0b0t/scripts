#!/bin/sh
#
########################################################################
# Install IP Messenger for Linux
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v1.0 8/15,2008
#       Stable.
########################################################################

IPMSG=g2ipmsg-0.9.5

sudo aptitude -y install libgtk2.0-dev libgnomeui-dev libpanelappletmm-2.6-dev

mkdir install_ipmsg
cd install_ipmsg

wget http://www.ipmsg.org/archive/$IPMSG.tar.gz
tar xzvf $IPMSG.tar.gz
cd $IPMSG
./configure
make
sudo make install
cd ..
sudo mkdir -p /usr/local/src/ipmsg
sudo cp -av $IPMSG/ /usr/local/src/ipmsg/

cd ..
rm -rf install_ipmsg

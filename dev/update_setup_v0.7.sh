#!/bin/sh
#
# This scripts updates environment from 0.7 to 0.8
########################################################################

test -n "$SCRIPTS" || export SCRIPTS=$HOME/scripts
test -n "$PRIVATE" || export PRIVATE=$HOME/private/scripts

smart_apt() {
    while [ $# -gt 0 ]
    do
        if [ `aptitude search $1 | awk '/^i/' | wc -l` = 0 ]; then
            sudo apt-get -y install $1
        fi
        shift
    done 
}

setup_apt_source() {
    SOURCESLIST=sources-$DISTRIB_CODENAME.list
    sudo cp $PRIVATE/etc/$SOURCESLIST /etc/apt/sources.list
    sudo vi /etc/apt/sources.list
    sudo apt-get update
}

increase_debian_packages() {
    $SCRIPTS/installer/debian_apt.sh
}

xvfb_packages() {
    smart_apt \
      xvfb \
      fluxbox \
      x11vnc
}

install_private_iptables() {
    $PRIVATE/installer/install_iptables.sh debian
    sudo vim /etc/network/if-pre-up.d/iptables
    sudo /etc/init.d/networking restart
}

install_termtter_plugins() {
    $PRIVATE/installer/install_dottermtter.sh
    $SCRIPTS/installer/install_termtter_plugins.sh
}

remove_incr_zsh() {
    sudo rm -f /etc/zsh/plugins/incr.zsh*
}

decrease_debian_packages() {
    sudo aptitude -y purge rubygems rubygems1.8
}

edit_cronjob() {
    test -f /etc/cron.hourly/$1 && \
      sudo vim /etc/cron.hourly/$1
    test -f /etc/cron.daily/$1 && \
      sudo vim /etc/cron.daily/$1
    test -f /etc/cron.weekly/$1 && \
      sudo vim /etc/cron.weekly/$1
    test -f /etc/cron.weekday/$1 && \
      sudo vim /etc/cron.weekday/$1
    test -f /etc/cron.weekend/$1 && \
      sudo vim /etc/cron.weekend/$1
    test -f /etc/cron.monthly/$1 && \
      sudo vim /etc/cron.monthly/$1
}

edit_cronjobs() {
    edit_cronjob deferred-sync
    edit_cronjob clamscan
    edit_cronjob get_resources
}

install_kernel() {
    $SCRIPTS/installer/install_linux_image.sh $1 $2
}

install_dot_files() {
    $SCRIPTS/installer/install_dotfiles.sh
}

install_deferred_sync() {
    $PRIVATE/installer/install_deferred-sync.sh
}

operation() {
    test -n "$SCRIPTS" || export SCRIPTS=$HOME/scripts
    test -n "$PRIVATE" || export PRIVATE=$HOME/private/scripts
    test -f /etc/lsb-release && DISTRIB_CODENAME=lucid
    test -f /etc/lsb-release || DISTRIB_CODENAME=squeeze
    setup_apt_source
    increase_debian_packages
    xvfb_packages
    #install_private_iptables
    install_termtter_plugins
    remove_incr_zsh
    #decrease_debian_packages
    edit_cronjobs
    test -f /etc/lsb-release && install_kernel $1 $2
    install_dot_files
    install_deferred_sync
}

operation $*

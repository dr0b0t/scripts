#!/bin/bash

case $OSTYPE in
  *darwin*)
    OPTIONS=-Rv
    ;;
  *)
    OPTIONS=-Rvd
    ;;
esac

test -d ~/.emacs.d && rm -rf ~/.emacs.d/
test -f ~/.emacs && rm -f ~/.emacs

test -d $SCRIPTS/dot_files/dot_emacs.d || exit 1
cp $OPTIONS $SCRIPTS/dot_files/dot_emacs $HOME/.emacs
TARGET=$HOME/.emacs.d
test -d $TARGET || mkdir -p $TARGET
cp $OPTIONS $SCRIPTS/dot_files/dot_emacs.d/* $TARGET/
chmod 600 $TARGET/elisp/twitter-account.el
vim $TARGET/elisp/twitter-account.el


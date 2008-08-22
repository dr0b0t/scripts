#!/bin/bash

case $OSTYPE in
  *darwin*)
    OPTIONS=-Rv
    ;;
  *)
    OPTIONS=-Rvd
    ;;
esac

test -d $SCRIPTS/dot_files/dot_emacs.d || exit 1
cp $OPTIONS $SCRIPTS/dot_files/dot_emacs $HOME/.emacs
TARGET=$HOME/.emacs.d
test -d $TARGET || mkdir -p $TARGET
cp $OPTIONS $SCRIPTS/dot_files/dot_emacs.d/* $TARGET/


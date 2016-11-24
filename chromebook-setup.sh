#!/bin/bash
CROUTON_HOME=/mnt/stateful_partition/crouton/chroots/precise/home/markham/

cd $CROUTON_HOME

. ./setup.sh

wget https://gist.githubusercontent.com/entrity/08fd4d2701cb72675b227859eaacedab/raw/28b851fa92fffffec6eed8e7b125524eef1ce9c8/.bash_aliases

echo 'cd $HOME' >> $HOME/.bashrc

echo 'alias fl="sudo chroot-enter"' >> $HOME/.bash_aliases

echo env | grep LS_COLORS >> $CROUTON_HOME/.bashrc

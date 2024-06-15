#!/usr/bin/env bash

CURDIR=$(dirname $(realpath $0))

shopt -s dotglob
shopt -s globstar

read -p "Do you want to change your bash? (y/n) " yn
if [[ ($yn = [Yy]*) && (-d $CURDIR/bash) ]]; then
    ln -i -s $CURDIR/bash/* ~
fi

read -p "Do you want to change your vim? (y/n) " yn
if [[ ($yn = [Yy]*) && (-d $CURDIR/vim) ]]; then
    ln -i -s $CURDIR/vim/* ~
fi

read -p "Do you want to change your tmux? (y/n) " yn
if [[ ($yn = [Yy]*) && (-d $CURDIR/tmux) ]]; then
    ln -i -s $CURDIR/tmux/* ~
fi

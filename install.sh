#!/usr/bin/env bash

echo "VimVundle - Starting Configuration!"
echo

create_symlinks () {
    if [ ! -f ~/.vim ]; then
        echo "Now, we will create ~/.vim and ~/.vimrc files, pointing to the directory vimvundle,"
        echo "to configure Vim. Is the best practice."
        ln -sfn vimvundle ~/.vim
    fi

    if [ ! -f ~/.vimrc ]; then
        ln -sfn vimvundle/vimrc ~/.vimrc
    fi
  }

echo "1) Create symlinks, if there is no."
echo "2) Create tmp directory in vimvundle."
echo "3) Create bundle directory in vimvundle."

if [ -d "vimvundle" ]; then
    cd
    create_symlinks
    cd vimvundle

    if [ ! -d "bundle" ]; then
        echo "Now, we will create a separate directory to store the bundles Vim will use."
        mkdir -p tmp/backup tmp/swap tmp/undo
        mkdir bundle
    fi
fi

echo
echo "Enjoy!"

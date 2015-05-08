#!/bin/bash

dir=~/etc                            # dotfiles directory
files="zshrc oh-my-zsh gitconfig"    # list of files/folders to symlink in homedir


# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

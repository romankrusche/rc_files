#!/bin/bash

cp /home/roman/.vimrc .
cp -r /home/roman/.vim
cp /home/roman/.bashrc .
cp /home/roman/initMyLinux.sh .

git add -A
git commit -m "update"
git push -u origin master

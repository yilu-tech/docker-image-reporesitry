#!/bin/bash

apk -U add neovim python3-dev py3-pip gcc g++ nodejs

pip install neovim

mkdir -p /root/.vim /root/.config
ln -s /root/.vim /root/.config/nvim
ln -s /root/.vimrc /root/.vim/init.vim

rm /usr/bin/nv && ln -s /usr/bin/nvim /usr/bin/vi

#!/bin/bash

ln -s $(pwd)/config/nvim ${HOME}/.config/nvim
ln -s $(pwd)/local/share/nvim ${HOME}/.local/share/nvim

#add nvim to path
echo 'export PATH="'$(pwd)'/bin:${PATH}"' >> "${HOME}/.bashrc"
#source updated .bashrc
source ${HOME}/.bashrc

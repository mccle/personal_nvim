REPO_ROOT=$(pwd)
INSTALL_PREFIX=${REPO_ROOT}/usr

if [ ! -d ${INSTALL_PREFIX} ]; then
    mkdir ${INSTALL_PREFIX}
fi

if [ -d ${INSTALL_PREFIX}/bin ]; then
	echo "nvim is already compiled"
else
    echo "nvim is not compiled yet, running make now"
    cd neovim
    make CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    make install
fi

line_in_file() {
    if [ -f "$2" ]; then
        grep -qF "$1" "$2"
    else
	false
    fi
}

if line_in_file "export PATH=${INSTALL_PREFIX}/bin:\${PATH}" ~/.bashrc; then
    echo "nvim is already added to your path"
elif line_in_file "export PATH=${INSTALL_PREFIX}/bin:\${PATH}" ~/.zshrc; then
    echo "nvim is already added to your path"
else
    if [ -n ${BASH_VERSION} ]; then
        echo "export PATH=${INSTALL_PREFIX}/bin:\${PATH}" >> ~/.bashrc
        echo "Added nvim to your path"
    elif [ -n ${ZSH_VERSION} ]; then
	echo "export PATH=${INSTALL_PREFIX}/bin:\${PATH}" >> ~/.zshrc
        echo "Added nvim to your path"
    else
	echo "Shell not supported. Add ${INSTALL_PREFIX}/bin to your path manually"
    fi
fi

if [ -L ~/.config/nvim ]; then
    unlink ~/.config/nvim
fi

ln -s ${REPO_ROOT}/NvChad ~/.config/nvim

echo "Symlink updated"

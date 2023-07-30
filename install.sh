repo_root=$(pwd)
install_prefix=${repo_root}/usr

if [ ! -d ${install_prefix} ]; then
    mkdir ${install_prefix}
fi

if [ -d ${install_prefix}/bin ]; then
	echo "nvim is already compiled"
else
    echo "nvim is not compiled yet, running make now"
    cd neovim
    make CMAKE_INSTALL_PREFIX=${install_prefix}
    make install
fi

cd ${repo_root}


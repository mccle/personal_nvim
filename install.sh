repo_root=$(pwd)
install_prefix=${repo_root}/usr

cd neovim
if [ -d ${install_prefix}/bin ]; then
	echo "nvim is already compiled"
else
    echo "nvim is not compiled yet, running make now"
    make CMAKE_INSTALL_PREFIX=${install_prefix}
    make install
fi

cd ${cwd}

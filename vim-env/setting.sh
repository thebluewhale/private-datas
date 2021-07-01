#!/bin/sh 

echo "################################"
echo "> download vundle"
if [ -d "$PWD/.vim/bundle/vundle" ]; then
	echo "> skip"
else
	git clone https://github.com/gmarik/vundle.git $PWD/.vim/bundle/vundle
fi


echo "################################"
echo "> Link .vimrc"
if [ -h "$HOME/.vimrc" ]; then
	echo "> .vrimc(symbolic link) already exist. It will removed."
	rm $HOME/.vimrc
elif [ -f "$HOME/.vimrc" ]; then
	echo "> .vimrc already exist"
	echo "> change .vimrc to .vimrc.bak"
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi
ln -s $PWD/.vimrc $HOME/.vimrc


echo "################################"
echo "> Link .gvimrc"
if [ -f "$HOME/.gvimrc" ]; then
	echo "> .gvimrc already exist"
	echo "> change .gvimrc to .gvimrc.bak"
	mv $HOME/.gvimrc $HOME/.gvimrc.bak
fi
ln -s $PWD/.gvimrc $HOME/.gvimrc


echo "################################"
echo "> Link .vim"
if [ -d "$HOME/.vim" ]; then
	echo "> .vim already exist"
	echo "> change .vim to .vim.bak"
	mv $HOME/.vim $HOME/.vim.bak
fi
ln -s $PWD/.vim $HOME/.vim


echo "################################"
echo "> Install Plugins" 
vim +PluginInstall +qall

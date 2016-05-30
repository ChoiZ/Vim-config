# SETUP:

You must at least have vim 7.4. (check in vim with :version or with bash vim --version)

To setup on your system, open a terminal and paste the following code.

```
mv ~/.vim ~/.vim-backup-`date +%F`
git clone https://github.com/ChoiZ/Vim-config.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
cd bundle/Shougo/vimproc && make
```

Require: ctags and C compiler.

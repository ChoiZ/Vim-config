# SETUP:

You must at least have vim 7.4. (check in vim with :version or with bash vim --version)

To setup on your system, open a terminal and paste the following code.

```bash
mv ~/.vim ~/.vim-backup-`date +"%Y-%m-%d"`

git clone git://github.com/ChoiZ/Vim-config.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim && git checkout develop

git submodule init && git submodule update

sudo apt-get install ctags
```

Last modified: 2013-03-19

SETUP :
=======

To setup on your system, open a terminal and paste the following code.

git clone https://github.com/ChoiZ/Vim-config.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim && git submodule init && git submodule update


CTAGS Setup:
===

On Arch Linux:

    $ su
    # pacman -S ctags

On debian / ubuntu:

    $ sudo apt-get install exuberant-ctags
  
  don't forget to update the path if it's different in the vimrc's file

On a Mac:

    $ cd ~ && mkdir ctags && cd ctags
    $ curl -O http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    $ tar xzvf ctags-5.8.tar.gz
    $ cd ctags-5.8 && ./configure
    $ make && sudo make install
    $ sudo chmod a+r /usr/local/bin
    $ sudo chmod a+x /usr/local/bin
  
  don't forget to update the path if it's different in the vimrc's file


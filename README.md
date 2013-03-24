<h1>SETUP:</h1>

You must at less have vim 7.3.

To setup on your system, open a terminal and paste the following code.

```bash
git clone git://github.com/ChoiZ/Vim-config.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim && git submodule init && git submodule update
```

<h1>CTAGS Setup:</h1>


<h2>On Linux</h2>

<h3>Arch Linux</h3>

```bash
su
pacman -S ctags
```

<h3>Debian / Ubuntu</h3>

```bash
sudo apt-get install exuberant-ctags
```  

<h2>On Mac</h2>

```bash
cd ~ && mkdir ctags && cd ctags
curl -O http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar -xzvf ctags-5.8.tar.gz
cd ctags-5.8 && ./configure
make && sudo make install
sudo chmod a+r /usr/local/bin
sudo chmod a+x /usr/local/bin
```

don't forget to update the path if it's different in the vimrc's file

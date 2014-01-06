# SETUP:

You must at least have vim 7.3. (check in vim with :version or with bash vim --version)

To setup on your system, open a terminal and paste the following code.

```bash
git clone git://github.com/ChoiZ/Vim-config.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim && git submodule init && git submodule update
```

# CTAGS Setup:

## On Linux

### Arch Linux

```bash
su
pacman -S ctags
```

### Debian / Ubuntu

```bash
sudo apt-get install exuberant-ctags
```

## On Mac

```bash
brew install ctags
```

```bash
cd ~ && mkdir ctags && cd ctags
curl -O http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar -xzvf ctags-5.8.tar.gz
cd ctags-5.8 && ./configure
make && sudo make install
sudo chmod a+r /usr/local/bin
sudo chmod a+x /usr/local/bin
```

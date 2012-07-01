To setup on your system, open a terminal and paste the following code.

git clone https://github.com/ChoiZ/Vim-config ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

SETUP :
=======

If you don't want to use CTAGS don't forget to add a double quote (") before the last 4 lines in vimrc's file :
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

CTAGS Setup:
===

On debian / ubuntu:

	$ sudo apt-get install exuberant-ctags
	don't forget to update the path if it's different in the vimrc's file

On a Mac:

	$ cd ~; mkdir ctags; cd ctags
	$ curl -O http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
	$ tar xzvf ctags-5.8.tar.gz
	$ cd ctags-5.8
	$ ./configure
	$ make
	$ sudo make install
	$ sudo chmod a+r /usr/local/bin
	$ sudo chmod a+x /usr/local/bin
	don't forget to update the path if it's different in the vimrc's file

Using ctags:
===

Hit <CTRL> + F (like function)

JS example file:
================

Create a file "test.js":

	function myFunction(param) { console.log('param: '+param); }

You can use the jsBeautify function to "beautify" your js files :

Hit <CTRL> + P

jsBeautify change the code to this:

	function myFunction(param) {
		console.log('param: ' + param);
	}

PHP example file:
=================

Example #1:
===

Create a file "test.php":

	<?php

	function getTime() {
		return date('H:i:s');
	}

	echo getTime(); // here you can see the suggest ;)
	?>

![screenshot1](https://github.com/ChoiZ/Vim-config/raw/master/screenshot1.png)

On the line 3 ( function getTime() { ) you can use <CTRL> + P to make the phpdoc of this function.

![screenshot2](https://github.com/ChoiZ/Vim-config/raw/master/screenshot2.png)

	<?php

	/**
	 * getTime 
	 * 
	 * @access public
	 * @return void
	 */
	function getTime() {
		return date('H:i:s');
	}

	echo getTime();
	?>

![screenshot3](https://github.com/ChoiZ/Vim-config/raw/master/screenshot3.png)


Example #2: 
===

Create a file "test.php" with an error:

	<?php 

	echo "Hello" // we forget the ;
	echo "World!";
	?>

![screenshot4](https://github.com/ChoiZ/Vim-config/raw/master/screenshot4.png)

Now you can use <CTRL> + L (to execute php -l).

![screenshot5](https://github.com/ChoiZ/Vim-config/raw/master/screenshot5.png)

Ok now we correct our code:

![screenshot6](https://github.com/ChoiZ/Vim-config/raw/master/screenshot6.png)

Again <CTRL> + L (to execute php -l).

![screenshot7](https://github.com/ChoiZ/Vim-config/raw/master/screenshot7.png)


Example #3:
===

Create a file "test.php":

	<?php
	file_

(you want to display the differents php function like file_exists, file_get_contents... press <CTRL> + O (letter O not zero "0") to get the autosuggest).

![screenshot8](https://github.com/ChoiZ/Vim-config/raw/master/screenshot8.png)

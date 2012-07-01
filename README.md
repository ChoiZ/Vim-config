To setup on your system, open a terminal and paste the following code.

git clone https://github.com/ChoiZ/Vim-config ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc


h1. PHP example file :

h2. Example #1:

Create a file "test.php":
<pre>
<?php

function getTime() {
	return date('H:i:s');
}

echo getTime(); // here you can see the suggest ;)
?>
</pre>

![screenshot1](https://github.com/ChoiZ/Vim-config/raw/master/screenshot1.png)

On the line 3 ( function getTime() { ) you can use <CTRL> + P to make the phpdoc of this function.

![screenshot2](https://github.com/ChoiZ/Vim-config/raw/master/screenshot2.png)

<pre>
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
</pre>

![screenshot3](https://github.com/ChoiZ/Vim-config/raw/master/screenshot3.png)


h2. Example #2: 

Create a file "test.php" with an error:
<pre>
<?php 

echo "Hello" // we forget the ;
echo "World!";
?>
</pre>

![screenshot4](https://github.com/ChoiZ/Vim-config/raw/master/screenshot4.png)

Now you can use <CTRL> + L (to execute php -l).

![screenshot5](https://github.com/ChoiZ/Vim-config/raw/master/screenshot5.png)

Ok now we correct our code:

![screenshot6](https://github.com/ChoiZ/Vim-config/raw/master/screenshot6.png)

Again <CTRL> + L (to execute php -l).

![screenshot7](https://github.com/ChoiZ/Vim-config/raw/master/screenshot7.png)


h2. Example #3:

Create a file "test.php":
<pre>
<?php
file_ 
</pre>

(you want to display the differents php function like file_exists, file_get_contents... press <CTRL> + O (letter O not zero "0") to get the autosuggest).
![screenshot8](https://github.com/ChoiZ/Vim-config/raw/master/screenshot8.png)

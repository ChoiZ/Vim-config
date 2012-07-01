" .vimrc
"
" ChoiZ's .vimrc
" http://www.choiz.fr/vimrc
"
" Create on: 31th October 2008 for Vim 7.0.234
" Last edit: 18th January 2012 for Vim 7.3 
"
" This file is available on my github: http://www.github.com/ChoiZ/Vim-config
"
" Disable auto cmd
autocmd!

" Set nocompatible mode for vi
set nocompatible

" Set filetype
filetype on
filetype plugin on
filetype indent on

" Set syntax
syntax on

" Enable hidden caracters, replace tab by |
set list
set listchars=tab:\|\ 

" For html files set tl options
autocmd FileType html set formatoptions+=tl

" Set timeout on hit ctrl + another key
set timeoutlen=500

" Font, Background 
set guifont=Monaco:h10
set background=dark
colorscheme Tomorrow-Night-Bright

" Display commands
set showcmd

" Show next bracket ( { [ > ] } )    
set showmatch

" highlight search 
set hlsearch

" case insensitive on search
set ignorecase

" case sensitive for caps on search (/the return The, the... /The return only The)
set smartcase

" No error bells
set noerrorbells

" Blink on error
set visualbell

" Improves redrawing
set ttyfast

" Add line number
set number
" affiche la position du curseur
set ruler

set titlestring=%f title    " Display filename in terminal window
set rulerformat=%l:%c ruler " Display current column/line

" Indentation
set preserveindent
" Auto Indent
set autoindent
" Tab on autoindent
set shiftwidth=4
" Round 
set shiftround
" 1 Tab = 4 spaces
set tabstop=4
set softtabstop=4
" Set no expandtab retab
set noet|retab!

" Ligne wrap
set wrap
set textwidth=79
set formatoptions=qrn1

" Enable code folding, by syntax
set foldenable 
set foldmethod=syntax

" Hide mouse on typing 
set mousehide

" Create dictionary for custom expansions
set dictionary+=/Users/ChoiZ/.vim/dict.txt

" Define file format to utf-8
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Don't add empty newlines at the end of files
set binary
set noeol

" ne détuit pas le buffer
set nohidden

"Ajout du template html5
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
autocmd BufRead,BufNewFile *.css set ft=css syntax=css3
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Number of cmd in history
set history=100

" Number of undo
set undolevels=100

" PhpDoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR> 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" Jsbeautify
inoremap <C-O> <ESC>:call Jsbeautify()<CR> 
nnoremap <C-O> :call Jsbeautify()<CR> 
vnoremap <C-O> :call Jsbeautify()<CR> 

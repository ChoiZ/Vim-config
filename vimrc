" .vimrc file 
" by: François LASSERRE 
" http://www.choiz.fr/
" 
" Create on: 31th October 2008 for Vim 7.0.234 
" Last edit: 1st July 2012 for Vim 7.3 
" 
" This file is available on my github repo: 
" http://www.github.com/ChoiZ/Vim-config
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

" Enable hidden caracters, replace tab by »···
set lcs=tab:»·,trail:·
set list

" For html files set tl options
autocmd FileType html set formatoptions+=tl

" Jump 10 lines when running out of the screen
set scrolljump=10

" Indicate jump out of the screen when 5 lines before end of the screen
set scrolloff=5


" Set timeout on hit ctrl + another key
set timeoutlen=500

" colors: font, background and colorscheme
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
set ruler

" Display filename in terminal window
set titlestring=%f title

" Display current column/line
set rulerformat=%l:%c ruler

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

" Define file format to utf-8
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Don't add empty newlines at the end of files
set binary
set noeol

" Don't destroy buffer
set nohidden

" Add template for different kind of files
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Number of cmd in history
set history=100

" Number of undo
set undolevels=100

" Add autocomplete with <CTRL>+X and <CTRL>+N add inoremap to use <CTRL>+O
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType javascript call SetJsOptions()
function SetJsOptions()
	set omnifunc=javascriptcomplete#CompleteJS
	" JS Beautify
	inoremap <C-P> <ESC>:call Jsbeautify()<CR>
	nnoremap <C-P> :call Jsbeautify()<CR>
	vnoremap <C-P> :call Jsbeautify()<CR>
endfunction

autocmd Filetype php call SetPhpOptions()
function SetPhpOptions()
	set completefunc=phpcomplete#CompletePHP
	set completeopt=menu
	" Map <CTRL>-L to run PHP parser check
	noremap <C-L> :!php -l %<CR>
	" PHP Doc
	inoremap <C-P> <ESC>:call PhpDocSingle()<CR>
	nnoremap <C-P> :call PhpDocSingle()<CR>
	vnoremap <C-P> :call PhpDocRange()<CR>
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete

inoremap <C-O> <C-x><C-o>

" .vimrc file 
" Create on: 31th October 2008 for Vim 7.0.234 
" Last edit: 9th November 2012 for Vim 7.3 
" version: 569 
" by: François LASSERRE 
" http://www.choiz.fr/
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
set list
if version >= 703 
	set lcs=tab:»·,trail:·
else
	set listchars=tab:\|\ 
endif

" For html files set tl options
autocmd FileType html set formatoptions+=tl

" Jump 10 lines when running out of the screen
set scrolljump=1

" Indicate jump out of the screen when 5 lines before end of the screen
set scrolloff=1


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
noremap <Tab> za
noremap <S-Tab> zA
autocmd FileType html,xhtml,javascript,css,c,cpp,php,python setlocal foldmethod=indent
"set foldlevelstart=1
if &columns > 80
	set foldcolumn=2
endif
set foldlevel=99

" Create view for each files
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Hide mouse on typing
set mousehide

" Define file format to utf-8
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Don't add empty newlines at the end of files
set binary
set noeol

" Map Leader
:let mapleader = ","
nnoremap <Leader>cp yyp
nnoremap <Leader>ft Vatzf
nnoremap <Leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <Leader>q gqip
" spliting
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>h :new<cr>:e 
" vimrc
nnoremap <Leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Highlight To do list with green background
highlight Todo ctermfg=black ctermbg=green guifg=black guibg=green
highlight Notice ctermfg=white ctermbg=blue guifg=white guibg=blue
highlight Fixme ctermfg=white ctermbg=red guifg=white guibg=red

" todolist match
:call matchadd('Todo','[T|t][O|o][D|d][O|o]')
:call matchadd('Notice','[N|n][O|o][T|t][I|i][C|c][E|e]')
:call matchadd('Fixme','[F|f][I|i][X|x][M|m][E|e]')

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
	inoremap <C-L> <ESC>:w<CR>:!php -l %<CR>
	nnoremap <C-L> :w<CR>:!php -l %<CR>
	vnoremap <C-L> :w<CR>:!php -l %<CR>
	" PHP Doc
	inoremap <C-P> <ESC>:call PhpDocSingle()<CR>
	nnoremap <C-P> :call PhpDocSingle()<CR>
	vnoremap <C-P> :call PhpDocRange()<CR>
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete

inoremap <C-O> <C-x><C-o>

" If you want to use ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 
inoremap <C-F> :TlistToggle<CR>
nnoremap <C-F> :TlistToggle<CR>
vnoremap <C-F> :TlistToggle<CR>
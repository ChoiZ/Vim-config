<<<<<<< HEAD
" .vimrc file
" Create on: 31th October 2008 for Vim 7.0.234
" Last edit: 16th March 2013 for Vim 7.3
" version: 572
" by: François LASSERRE
"
" vim: set fdm=marker:fdl=0:
"
" This file is available on my github repo:
=======
" .vimrc file 
" Create on: 31th October 2008 for Vim 7.0.234 
" Last edit: 14th March 2013 for Vim 7.3 
" version: 571 
" by: François LASSERRE 
" http://www.choiz.fr/
" 
" This file is available on my github repo: 
>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590
" http://www.github.com/ChoiZ/Vim-config
"

<<<<<<< HEAD

" Autoreload vimrc on change
autocmd! BufWritePost vimrc source $MYVIMRC
autocmd! BufWritePost .vimrc source $MYVIMRC

=======
>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590
" Set nocompatible mode for vi
set nocompatible

" Add pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



" Folders Settings (backup, undo…) {{{

set backup
if filewritable(expand("~/.vim/backup")) == 2
	set backupdir=~/.vim/backup
else
	if has("unix") || has("win32unix")
		call system("mkdir $HOME/.vim/backup -p")
		set backupdir=~/.vim/backup
	endif
endif

set undofile
if filewritable(expand("~/.vim/undodir")) == 2
	set undodir=~/.vim/undodir
else
	if has("unix") || has("win32unix")
		call system("mkdir $HOME/.vim/undodir -p")
		set undodir=~/.vim/undodir
	endif
endif

set history=100		" Number of cmd in history
set undolevels=100	" Number of undo


" }}}

" TERM Preferences {{{

set t_Co=256				" The terminal supports 256 colors
set title
set titlestring=%f title	" Display filename in terminal window

<<<<<<< HEAD

=======
" For html files set tl options
"autocmd FileType html set formatoptions+=tl
autocmd FileType html set formatoptions+=gmrLtTa
>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590

" }}}

" FILES Preferences {{{

" Set syntax highlighting
syntax on

" Set filetype
filetype on
filetype plugin on

" Define file format to utf-8
set encoding=utf-8 nobomb
set fileencoding=utf-8
set binary
set noeol					" Don't add empty newlines at the end of files

" colors: font, background and colorscheme
set guifont=Monaco:h10
set background=dark
colorscheme Tomorrow-Night-Bright

set showcmd
set showmatch		" Show open or close bracket
set number			" Add line number
set ruler
set cursorline		" View currentline

set modeline




" }}}

" SEARCH / BELLS ERROR {{{

set hlsearch		" highlight search
set ignorecase		" case insensitive on search
set smartcase		" case sensitive for caps on search (/the return The, the... /The return only The)

set noerrorbells	" No error bells
set visualbell		" Blink on error



" }}}

" TEXT Preferences (indent,listchars,wrap) {{{

set preserveindent
set tabstop=4		" 1 Tab = 4 spaces
set shiftwidth=4	" Tab on autoindent
"set shiftround		" Round
set softtabstop=4
set noet|retab!		" Set no expandtab retab
"set et
set cindent
set smartindent
"set autoindent

"set listchars=nbsp:¤,tab:··,trail:¤,extends:>,precedes:<
set listchars=tab:\ \ ,trail:¤,extends:>,precedes:<
set list
set backspace=indent,eol,start

"set textwidth=80
set nowrap
set colorcolumn=+0
"set formatoptions=qn1

"set mouse=a
"set mousehide
"set clipboard=unnamed
"set pastetoggle=<F10>

" Don't destroy buffer
set nohidden

<<<<<<< HEAD


" }}}

" LAYOUT {{{

"" bépo
=======
" Ligne wrap
"set wrap
"set textwidth=79
"set formatoptions=qn1

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
:call matchadd('Todo','[T|t][O|o][D|d][O|o]')

" Don't destroy buffer
set nohidden

" Add template for different kind of files
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Number of cmd in history
set history=100

" Number of undo
set undolevels=100

" bépo
>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590
noremap s :w
noremap é w
noremap w <C-w>
noremap « <
noremap » >

<<<<<<< HEAD


" }}}

" PLUGINS {{{

"" Indent_Guides {{{
=======
"let g:Powerline_symbols = 'fancy'
let g:PIVAutoClose = 1
let g:DisableAutoPHPFolding = 1

" Indent_Guides
>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1
<<<<<<< HEAD
"" }}}

"" Gitgutter {{{
=======

>>>>>>> a64522cc7daa5f8de5ee54a1fc86ca3122c0d590
let g:gitgutter_highlight_lines = 1
" Mapping
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>
"" }}}


" }}}

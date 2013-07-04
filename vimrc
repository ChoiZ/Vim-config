" .vimrc file
"
" vim: set foldmethod=marker:
"
" Create on: 31th October 2008 for Vim 7.0.234
" Last edit: 4th July 2013 for Vim 7.3
" version: 581
" by: François LASSERRE
"
" This file is available on my github repo:
" http://www.github.com/ChoiZ/Vim-config
"

" Autoreload vimrc on change
autocmd! BufWritePost vimrc source $MYVIMRC
autocmd! BufWritePost .vimrc source $MYVIMRC

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

set history=100 " Number of cmd in history
set undolevels=100 " Number of undo

" }}}


" TERM Preferences {{{

set t_Co=256 " The terminal supports 256 colors
set title
set titlestring=%f title " Display filename in terminal window

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
set noeol " Don't add empty newlines at the end of files

" colors: font, background and colorscheme
set guifont=Monaco:h10
set background=dark
colorscheme Tomorrow-Night-Bright

set showcmd
set showmatch " Show open or close bracket
set number " Add line number
set ruler
set cursorline " View currentline
set laststatus=2 " Always show the statusline

set modeline
set modelines=5

" }}}


" SEARCH / BELLS ERROR {{{

set hlsearch " highlight search
set ignorecase " case insensitive on search
set smartcase " case sensitive for caps on search
	"(/the return The, the... /The return only The)

set noerrorbells " No error bells
set visualbell " Blink on error

" }}}


" TEXT Preferences (indent,listchars,wrap) {{{

"set preserveindent
set tabstop=4 " 1 Tab = 4 spaces
set shiftwidth=4 " Tab on autoindent
set softtabstop=4
"set noet|retab! " Set no expandtab retab
set expandtab
set cindent
set smartindent
"set autoindent

set listchars=tab:\ \ ,trail:¤,extends:>,precedes:<,nbsp:¬
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

" }}}


" LAYOUT {{{

"" bépo {{{
noremap s :w<CR>
noremap « <
noremap » >
"" }}}

"" Clear Search {{{
noremap <F2> :let @/ = ""<CR>
"" }}}

" }}}


" PLUGINS {{{

"" Indent_Guides {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1
"" }}}

"" Gitgutter {{{
let g:gitgutter_highlight_lines = 1
" Mapping
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>
"" }}}

"" Powerline {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_n = ' N '
let g:Powerline_stl_path_style = 'full'
"" }}}

"" Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"" }}}

"" PHP Doc {{{
let g:pdv_cfg_Author = "François LASSERRE <flasserre@veoprint.com>"
let g:pdv_cfg_Copyright = "Copyright (c) Veoprint 2013 All rights reserved."
"" }}}

" }}}

function! <SID>StripTrailingWhitespace()
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
nmap <silent> <Leader><enter> :%s/^\(\s*\n\)\+/\r<CR>

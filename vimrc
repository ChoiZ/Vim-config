" .vimrc file
"
" vim: set foldmethod=marker:
"
" Created on: 31th October 2008
" Edited on: 29 May 2016
" Version #: 598
"
" This file is available on my github repo:
" http://www.github.com/ChoiZ/Vim-config

" Remove Thanks for Flying Vim
let &titleold=getcwd()

" Set nocompatible mode for vi
set nocompatible

" require by vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'spf13/PIV'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'ChoiZ/taglist.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'm2mdas/phpcomplete-extended'
Bundle 'm2mdas/phpcomplete-extended-symfony'

" Color schemes
Plugin 'ChoiZ/vim-tomorrow-night'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Resize splits when the window is resized: http://vimbits.com/bits/223
au VimResized * exe "normal! \<c-w>="

" Backup - Swap Settings (undo file, levels, history…) {{{
set nobackup
set noswapfile

if version >= 703
    set undofile
    if filewritable(expand("~/.vimundodir")) == 2
        set undodir=~/.vimundodir
    else
        if has("unix") || has("win32unix")
            call system("mkdir $HOME/.vimundodir")
            set undodir=~/.vimundodir
        endif
    endif
endif

set history=100			    " Number of cmd in history
set undolevels=100		    " Number of undo
" }}}

" TERM Preferences {{{
set t_Co=256		        " The terminal supports 256 colors
set title
set titlestring=%f title	" Display filename in terminal window
" }}}

" FILES Preferences {{{
filetype plugin indent on   " Set filetype
syntax on                   " Set syntax highlighting

autocmd VimEnter COMMIT_EDITMSG setlocal filetype=gitcommit

" Show Git diff in window split when commiting: http://vimbits.com/bits/173
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

" Define file format to utf-8
set encoding=utf-8 nobomb	" No Byte Order Mark!
set fileencoding=utf-8      " File encode to utf-8
set binary
set noeol			        " Don't add empty newlines at the end of files

" colors: font, background and colorscheme
set guifont="Monaco for Powerline":h10
set background=dark
colorscheme Tomorrow-Night-Bright

set showcmd
set showmatch			    " Show open or close bracket
set number			        " Add line number
set norelativenumber        " No relative number (enable it with F12)
set ruler
set cursorline			    " View currentline
set laststatus=2		    " Always show the statusline
set foldcolumn=2
set modeline
set modelines=5
" }}}

" SEARCH / BELLS ERROR {{{
set hlsearch			    " highlight search
set ignorecase			    " case insensitive on search
set smartcase			    " case sensitive for caps on search
set noerrorbells		    " No error bells
set visualbell			    " Blink on error

" Highlight trailing spaces: http://vimbits.com/bits/478
match Error /\s\+$/
" }}}

" TEXT Preferences (indent,listchars,wrap) {{{
"set preserveindent
set tabstop=4			    " 1 Tab = 4 spaces
set shiftwidth=4		    " Tab on autoindent
set softtabstop=4
set textwidth=80
set wrapmargin=2
set expandtab
set cindent
set smartindent
set listchars=tab:\ \ ,trail:¤,extends:>,precedes:<,nbsp:¬
set list
set backspace=indent,eol,start
set nowrap
if version >= 703
    set colorcolumn=+0
endif
set mouse=a
set mousehide
set clipboard=unnamedplus
set pastetoggle=<F10>
set nohidden                " Don't destroy buffer
" }}}

" LAYOUT {{{
"" bépo {{{
noremap « <
noremap » >
"" }}}

"" mapping {{{
" CTRL + U: Upercase first char of the line http://vimbits.com/bits/505
nnoremap <C-U> :%s/^./\u&/g<CR>

"vmap <D-c> "*y
"imap <D-v> <ESC>"*gPa
"nmap <D-v> "*gP

noremap <BS> <PageUp>
noremap <Space> <PageDown>

" lazy code folding / unfolding
" toggle fold open (zo)/close (zc)
noremap <C-Tab> za
" toggle fold open (zO)/close (zC) on all folding levels
noremap <S-Tab> zA

noremap <C-S-Tab> zR

" Remove current search
noremap <silent><F2> :let @/ = ""<CR>

" Remove whitespace
noremap <silent> <F3> :call StripTrailingWhitespace()<CR>

" Display undotree
noremap <silent> <F5> :call UndotreeToggle()<CR>

" Open all Folds
noremap <F7> zR

""" FocusMode
nnoremap <silent> <F9> :call ToggleFocusMode()<CR>

""" ToogleNumber
nnoremap <silent> <F12> :call ToogleNumber()<CR>
"" }}}
" }}}

" FUNCTIONS {{{
function! StripTrailingWhitespace()
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    %s/
//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! ToggleFocusMode()
    if (&ruler)
        set laststatus=0
        set foldcolumn=0
        set nonumber
        set noruler
        hi IndentGuidesEven guifg=none ctermbg=none
        hi IndentGuidesOdd guifg=none ctermbg=none
        hi CursorLine guifg=none ctermbg=none
        hi FoldColumn guifg=none ctermbg=none
        hi LineNr guifg=none ctermbg=none
        hi NonText ctermfg=0
        execute 'SignifyToggle'
    else
        set laststatus=2
        set foldcolumn=2
        set number
        set ruler
        execute 'colorscheme ' . g:colors_name
        execute 'SignifyToggle'
    endif
endfunc

function! ToogleNumber()
    if (&relativenumber == 1)
        set number
        set norelativenumber
    else
        set nonumber
        set relativenumber
    endif
endfunc
" }}}

" PLUGINS {{{

"" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" vim-powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch    = '⭠'
let g:airline_symbols.readonly  = '⭤'
let g:airline_symbols.linenr    = '⭡'
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
"" }}}

"" Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers = ['php']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
"" }}}

"" Unite {{{
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:phpcomplete_search_tags_for_variables = 1

nnoremap <C-p> :Unite file_rec/async<cr>
"" }}}

" }}}

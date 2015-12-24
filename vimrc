" .vimrc file
"
" vim: set foldmethod=marker:
"
" Created on: 31th October 2008
" Edited on: 24th December 2015
" Version #: 596
"
" This file is available on my github repo:
" http://www.github.com/ChoiZ/Vim-config

" Remove Thanks for Flying Vim
let &titleold=getcwd()

" Set nocompatible mode for vi
set nocompatible

" Resize splits when the window is resized: http://vimbits.com/bits/223
au VimResized * exe "normal! \<c-w>="

" Add pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
set clipboard+=unnamed
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

" PLUGINS {{{

"" neosnippet.vim {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"" }}}

"" Indent_Guides {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1
"" }}}

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
"" }}}

"" PHP Doc {{{
let g:pdv_cfg_Author = "François LASSERRE"
let g:pdv_cfg_Copyright = "Copyright (c) François LASSERRE ".strftime("%Y")." All rights reserved."
let curpwd=system('pwd')
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

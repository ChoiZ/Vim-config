" .vimrc file
"
" vim: set foldmethod=marker:
"
" Create on: 31th October 2008
" Last edit: 4nd January 2014
" version: 587
" by: François LASSERRE
"
" This file is available on my github repo:
" http://www.github.com/ChoiZ/Vim-config
"

" Autoreload vimrc on change
"autocmd! BufWritePost vimrc source $MYVIMRC
"autocmd! BufWritePost .vimrc source $MYVIMRC

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

set history=100			" Number of cmd in history
set undolevels=100		" Number of undo

" }}}


" TERM Preferences {{{

set t_Co=256			" The terminal supports 256 colors
set title
set titlestring=%f title	" Display filename in terminal window

" }}}


" FILES Preferences {{{

" Set filetype
filetype plugin indent on

" Set syntax highlighting
syntax on

set mouse=a
set mousehide

" Show Git diff in window split when commiting: http://vimbits.com/bits/173
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

" Define file format to utf-8
set encoding=utf-8 nobomb	" No Byte Order Mark!
set fileencoding=utf-8
set binary
set noeol			" Don't add empty newlines at the end of files

" colors: font, background and colorscheme
set guifont=Monaco:h10
set background=dark
colorscheme Tomorrow-Night-Bright

set showcmd
set showmatch			" Show open or close bracket
set number			" Add line number
set ruler
set cursorline			" View currentline
set laststatus=2		" Always show the statusline

set modeline
set modelines=5

" }}}


" SEARCH / BELLS ERROR {{{

set hlsearch			" highlight search
set ignorecase			" case insensitive on search
set smartcase			" case sensitive for caps on search
				"(/the return The, the... /The return only The)

set noerrorbells		" No error bells
set visualbell			" Blink on error

" }}}


" TEXT Preferences (indent,listchars,wrap) {{{

"set preserveindent
set tabstop=4			" 1 Tab = 4 spaces
set shiftwidth=4		" Tab on autoindent
set softtabstop=4
"set noet|retab!		" Set no expandtab retab
set expandtab
set cindent
set smartindent
"set autoindent

set listchars=tab:\ \ ,trail:¤,extends:>,precedes:<,nbsp:¬
set list
set backspace=indent,eol,start

"set textwidth=80
set nowrap
if version >= 703
    set colorcolumn=+0
endif
"set formatoptions=qn1

"set mouse=a
"set mousehide
"set clipboard=unnamed
set pastetoggle=<F10>

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

"" Neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_temporary_dir = $VIM_DIR.'/tmp/neocomplcache'

"" }}}

"" neosnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"" }}}

"" vim-snipmate {{{
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
"" }}}

"" Indent_Guides {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1
"" }}}

"" Powerline {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_n = ' N '
let g:Powerline_stl_path_style = 'full'
"" }}}

"" Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers=['jshint']
"" }}}

"" PHP Doc {{{
let g:pdv_cfg_Author = "François LASSERRE"
let g:pdv_cfg_Copyright = "Copyright (c) Veoprint ".strftime("%Y")." All rights reserved."
let curpwd=system('pwd')
"" }}}

" }}}

" Highlight trailing spaces: http://vimbits.com/bits/478
match Error /\s\+$/

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

nmap <silent> <F3> :call <SID>StripTrailingWhitespace()<CR>
nmap <silent> <F4> :%s/^\(\s*\n\)\+/\r<CR>
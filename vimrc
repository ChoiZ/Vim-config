" .vimrc file 
" Create on: 31th October 2008 for Vim 7.0.234 
" Last edit: 14th March 2013 for Vim 7.3 
" version: 571 
" by: François LASSERRE 
" http://www.choiz.fr/
" 
" This file is available on my github repo: 
" http://www.github.com/ChoiZ/Vim-config
" 

" Set nocompatible mode for vi
set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>

" Set filetype
filetype on
filetype plugin on
"filetype indent on

" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256 

" Set syntax
syntax on

" For html files set tl options
"autocmd FileType html set formatoptions+=tl
autocmd FileType html set formatoptions+=gmrLtTa

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

" View currentline
set cursorline

" Display filename in terminal window
set titlestring=%f title

" Display current line:column % in page
set rulerformat=%l:%v\ %P ruler

" Always show the statusline
set laststatus=2

" Indentation
set preserveindent

" Auto Indent
" set autoindent
set nosi noai

"set mouse=a
"set mousehide
"set clipboard=unnamed
"set pastetoggle=<F10>

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
noremap s :w
noremap é w
noremap w <C-w>
noremap « <
noremap » >

"let g:Powerline_symbols = 'fancy'
let g:PIVAutoClose = 1
let g:DisableAutoPHPFolding = 1

" Indent_Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1

let g:gitgutter_highlight_lines = 1

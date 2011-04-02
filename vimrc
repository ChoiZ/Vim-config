" .vimrc
"
" ChoiZ's .vimrc
" http://www.choiz.fr/vimrc
"
" Création le : 
" 31 Octobre 2008 pour Vim 7.0.234
" 
" Dernière édition le : 
" Samedi 2 Avril 2011 pour Vim 7.2.108 
"
" Ce fichier contient mes préférences Vim :)
"
" Configuration vim complete sur github : http://www.github.com/ChoiZ/Vim-config
"

" on desactive les commandes automatiques
autocmd!

" mode non compatible avec vi
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

autocmd FileType html set formatoptions+=tl

" Changer le timeout lors de ctr + une touche
set timeoutlen=500

" Theme 
colorscheme evening
" Police
set guifont=Monaco:h18

" affiche les commandes
set showcmd
" Affiche le prochain ( ) { } [ ] ...
set showmatch

" recherche incrémentale
set incsearch
" highlight la recherche
set hlsearch
" ignore la case lors d'une recherche
set ignorecase
set smartcase

" Pas de bip lors d'une erreur
set noerrorbells
" Fait clignter l'écran lors d'une erreur
set visualbell

" défini qu'on est dans une console (ameliore la rapidite de vim)
set ttyfast

" ajoute le numéro des lignes
set number
" affiche la position du curseur
set ruler
" souligne la ligne avec le curseur
set cursorline

" Indentation
set preserveindent
" Indentation automatique
set autoindent
" tabulation lors de l'autoindent
set shiftwidth=4
" arrondi
set shiftround
" tabulation = 4 espaces
set tabstop=4
set softtabstop=4
" remplace les tabulations par des espaces
set expandtab"

" ligne wrap
set wrap
set textwidth=79
set formatoptions=qrn1

" defini le code folding
set foldenable

" cache la souris lorsque l'on tape
set mousehide

" Create dictionary for custom expansions
set dictionary+=~/.vim/dict.txt

" utilisation de l'utf-8
set encoding=utf-8
set fileencoding=utf-8

" réduire les functions/methodes
set foldmethod=syntax

" ne détuit pas le buffer
set nohidden

"Ajout du template html5
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
autocmd BufRead,BufNewFile *.css set ft=css syntax=css3
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Nombre de commandes dans l'historique
set history=100
" Nombre de undo permis
set undolevels=100

" PhpDoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR> 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
" Jsbeautify
inoremap <C-O> <ESC>:call Jsbeautify()<CR> 
nnoremap <C-O> :call Jsbeautify()<CR> 
vnoremap <C-O> :call Jsbeautify()<CR> 

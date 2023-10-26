set encoding=utf8
set completeopt=noinsert,menuone,noselect
set hidden
set autoindent
set number
set title
set wildmenu
set guifont=hack_nerd_font:h15
syntax on
set spell
set ttyfast
filetype plugin indent on
set autowrite
autocmd FileType gitcommit setlocal spell
" Vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" add all your plugins here

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

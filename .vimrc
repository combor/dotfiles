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
autocmd Vimenter * nnoremap <C-e> <C-w>
autocmd FileType gitcommit setlocal spell
" Vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" add all your plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/pymode.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:pymode = 1
let g:pymode_options = 1

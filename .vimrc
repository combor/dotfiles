" Enable dark backround support
set background=dark

" Basic settings
"set hlsearch 
set number
set modeline

" Enable Syntax
syntax on

" Implement custom Color schemes
colorscheme molokayo

hi Normal ctermbg=none
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Filetype Recognition
filetype on
filetype plugin indent on

" Uncomment the following line to enable mouse in vim
" set mouse = a

" Disable code folding
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Source Code Indentation for python extensions
set cindent
set shiftwidth=4
set expandtab
set spelllang=en
set tabstop=4

au FileType py set autoindent
au FileType py set smartindent
au FileType c set autoindent
au FileType c set smartindent


execute pathogen#infect()

let g:go_fmt_command = "goimports"

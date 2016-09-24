map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

" Set spellcheck
autocmd FileType gitcommit,rst,md setlocal spell
au BufRead *.txt,*.md setlocal spell

" Highlight whitespace
" " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=DarkMagenta guibg=lightgreen
match ExtraWhitespace /\s\+$/

let g:go_fmt_command = "goimports"

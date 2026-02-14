set encoding=utf8
set hidden
set autoindent
set number
set title
set wildmenu
set autowrite
syntax on
filetype plugin indent on

nnoremap <C-e> <C-w>
autocmd FileType gitcommit setlocal spell

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

if executable('terraform-ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-ls',
        \ 'cmd': {server_info->['terraform-ls', 'serve']},
        \ 'allowlist': ['terraform'],
        \ })
endif
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-remote=auto']},
        \ 'allowlist': ['go', 'gomod', 'gohtmltmpl', 'gotexttmpl'],
        \ 'initialization_options': {
        \   'completeUnimported': v:true,
        \   'matcher': 'fuzzy',
        \   'codelenses': {
        \     'generate': v:true,
        \     'test': v:true,
        \   },
        \ },
        \ })
endif
if executable('ty')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ty',
        \ 'cmd': {server_info->['ty', 'server']},
        \ 'allowlist': ['python'],
        \ })
endif

autocmd BufWritePre *.tf,*.tfvars call execute('LspDocumentFormatSync')
autocmd BufWritePre *.go
    \ call execute('LspDocumentFormatSync') |
    \ call execute('LspCodeActionSync source.organizeImports')

nmap gd <plug>(lsp-definition)
nmap gr <plug>(lsp-references)
nmap K <plug>(lsp-hover)
nmap <leader>rn <plug>(lsp-rename)
nmap gi <plug>(lsp-implementation)
nmap gt <plug>(lsp-type-definition)
nmap ga <plug>(lsp-code-action)
nmap [g <plug>(lsp-previous-diagnostic)
nmap ]g <plug>(lsp-next-diagnostic)
nmap gs <plug>(lsp-document-symbol-search)
nmap gS <plug>(lsp-workspace-symbol-search)
nmap <leader>pd <plug>(lsp-peek-definition)
nmap <leader>dl <plug>(lsp-document-diagnostics)
nmap <leader>cl <plug>(lsp-code-lens)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

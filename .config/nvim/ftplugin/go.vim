se colorcolumn=100
se winwidth=103

se noexpandtab
se listchars=tab:\ \ ,trail:·

nnoremap <leader>m :Ag! "\bfunc <C-R><C-W>\b"<CR>:cw<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

let g:go_fmt_command = "goimports"

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1

set completeopt-=preview

au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

"nnoremap <leader>d :GoDef<CR>

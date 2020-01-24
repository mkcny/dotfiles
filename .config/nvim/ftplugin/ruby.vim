se colorcolumn=120
se winwidth=123
"se iskeyword+=!,?

nnoremap <leader>r :Ag! --ignore test --ruby "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>m :Ag! "\bdef (self.)?<C-R><C-W>\b"<CR>:cw<CR>

se colorcolumn=120
se winwidth=123
"se iskeyword+=!,?

nnoremap <leader>r :Ag! --ignore test --ruby "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>m :Ag! "\bdef <C-R><C-W>\b"<CR>:cw<CR>

let g:neomake_ruby_rubocop_exe = system('echo -n $(PATH=`pwd`/bin:$PATH which rubocop)')
"let &colorcolumn=join(range(120,600),",")


" Run rubocop autofix for the current file:

function! AutoFix()
  w
  !bin/rubocop -a %
  execute 'Neomake'
endfunction

"nnoremap <leader>r :call AutoFix()<CR>
"nnoremap <leader>r :w<CR>!bin/rubocop -a %<CR>:Neomake<CR>

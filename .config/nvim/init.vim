source ~/.vim/plugins.vim

se hidden
se hlsearch
se ignorecase
se smartcase
se cursorline
se clipboard=unnamed
se winwidth=85
se colorcolumn=80
se mouse=a
se list listchars=tab:»·,trail:·
se nobackup
se nowritebackup
se noswapfile
se directory=/tmp
se shiftwidth=2 tabstop=2 softtabstop=2 expandtab
se signcolumn=yes

filetype plugin indent on

set termguicolors
colorscheme base16-tomorrow-night

let mapleader = ","
let g:mapleader = ","

" open the file under the cursor
nnoremap <leader>o :vertical wincmd f<CR>

" search word under cursor
nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>a :Ag! --ignore test "\b<C-R><C-W>\b"<CR>:cw<CR>

" use fugitive to show the blame
nnoremap <leader>g :Git blame<CR>

" easier quitting
nnoremap <C-q> :q<CR>

" disable Ex mode
nnoremap Q <Nop>

" backslash to search within project
nnoremap \ :Rg<cr>

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

" close quickfix
nnoremap <space> :ccl<CR>

" Move around splits with <C-hjkl>
nnoremap <C-h> :wincmd h<CR>:wincmd =<CR>
nnoremap <C-j> :wincmd j<CR>:wincmd =<CR>
nnoremap <C-k> :wincmd k<CR>:wincmd =<CR>
nnoremap <C-l> :wincmd l<CR>:wincmd =<CR>

" tab stuff
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>q :tabclose<CR>
nnoremap <C-n> :tabprev<CR>
"nnoremap <C-m> :tabnext<CR>

" maintain visual selection after indenting
vmap < <gv
vmap > >gv

" ale config
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEWarning ctermbg=black

" use fzf for ctrl+p search
nnoremap <silent> <c-p> :FZF -m<CR>

" coc config

let g:go_def_mapping_enabled = 0 " disable vim-go :GoDef short cut (gd)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

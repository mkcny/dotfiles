call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'

call plug#end()

se hlsearch
se ignorecase
se smartcase
se clipboard=unnamed
se list listchars=tab:»·,trail:·
se winwidth=85
se colorcolumn=80
se mouse=a
se nu
se termguicolors
se noshowmode

colorscheme base16-onedark

let mapleader = ","
let g:mapleader = ","

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

" close quickfix
nnoremap <space> :ccl<CR>

" easier quitting
nnoremap <C-q> :q<CR>

" Move around splits with <C-hjkl>
nnoremap <C-h> :wincmd h<CR>:wincmd =<CR>
nnoremap <C-j> :wincmd j<CR>:wincmd =<CR>
nnoremap <C-k> :wincmd k<CR>:wincmd =<CR>
nnoremap <C-l> :wincmd l<CR>:wincmd =<CR>

" maintain visual selection after indenting
vmap < <gv
vmap > >gv

" toggle commenting for selected lines
map <leader>/ <plug>NERDCommenterToggle<CR>
vmap <leader>/ <plug>NERDCommenterToggle<CR>gv

" backslash to search within project
nnoremap \ :Rg<cr>

" search word under cursor
let g:ackprg = 'rg --vimgrep'
nnoremap <leader>f :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>a :Ack! -g '!*test*' -g '!*spec*' "\b<C-R><C-W>\b"<CR>:cw<CR>

" use fzf for ctrl+p search
nnoremap <silent> <c-p> :FZF -m<CR>

" use fugitive to show the blame
nnoremap <leader>g :Git blame<CR>

" coc config

"let g:go_def_mapping_enabled = 0 " disable vim-go :GoDef short cut (gd)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" shared clipboard for spin
if $SPIN == 1
  let g:clipboard = {
    \ 'name': 'pbcopy',
    \ 'copy': {'+': 'pbcopy', '*': 'pbcopy'},
    \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
    \ 'cache_enabled': 1 }
end

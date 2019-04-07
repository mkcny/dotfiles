call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'
Plug '/usr/local/opt/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'

call plug#end()

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
se directory=/tmp
se shiftwidth=2 tabstop=2 softtabstop=2 expandtab

filetype plugin indent on

colors mkcny

let mapleader = ","
let g:mapleader = ","


" open the file under the cursor
nnoremap <leader>o :vertical wincmd f<CR>

" search word under cursor
nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>a :Ag! --ignore test "\b<C-R><C-W>\b"<CR>:cw<CR>

" use fugitive to show the blame
nnoremap <leader>g :Gblame<CR>

" easier quitting
nnoremap <C-q> :q<CR>

" disable Ex mode
nnoremap Q <Nop>

" backslash to search within project
nnoremap \ :Ag<SPACE>

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

" avoid pinky strain
inoremap jj <Esc>

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
nnoremap <C-m> :tabnext<CR>

" maintain visual selection after indenting
vmap < <gv
vmap > >gv

" ale config
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEWarning ctermbg=black

nnoremap <silent> <c-p> :FZF -m<CR>

let g:deoplete#enable_at_startup = 1

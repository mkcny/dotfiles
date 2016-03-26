call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

call plug#end()

se number
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
se shiftwidth=2 tabstop=2 expandtab
se autoread

filetype plugin indent on

colors mkcny

let mapleader = ","
let g:mapleader = ","


" open the file under the cursor
nnoremap <leader>o :vertical wincmd f<CR>

" trim whitespace from the ends of lines
nnoremap <leader>t :%s/\s\+$//<CR>

" toggle showing whitespace
nnoremap <leader>l :se list!<CR>

" search word under cursor
nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>a :Ag! --ignore test "\b<C-R><C-W>\b"<CR>:cw<CR>

" use fugitive to show the blame
nnoremap <leader>g :Gblame<CR>

" backslash to search within project
nnoremap \ :Ag<SPACE>

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

" avoid pinky strain
inoremap jj <Esc>

" close quickfix
nnoremap <space> :ccl<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" maintain visual selection after indenting
vmap < <gv
vmap > >gv

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let g:airline_powerline_fonts = 1

autocmd! BufWritePost,BufEnter * Neomake

if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

set rtp+=/usr/local/opt/fzf
nnoremap <silent> <c-p> :FZF -m<CR>

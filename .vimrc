runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

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
se t_Co=256
se shiftwidth=2 tabstop=2 expandtab

se nocompatible
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

" use CtrlP to switch between buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" search word under cursor
nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" backslash to search within project
nnoremap \ :Ag<SPACE>

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

" avoid pinky strain
inoremap jj <Esc>


" maintain visual selection after indenting
vmap < <gv
vmap > >gv

let g:ctrlp_user_command=['.git', "cd %s && git ls-files . -co --exclude-standard | grep -v node_modules | grep -v -E '(png|jpg|gif)$'", 'find %s -type f']

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

if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

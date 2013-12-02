syntax on
se cursorline
se number
se laststatus=2
se winwidth=85
se cc=80
se clipboard=unnamed
se incsearch
se hlsearch
se ignorecase
se smartcase
se autoindent
se copyindent
se scrolljump=5
se expandtab
se shiftwidth=2
se tabstop=2
se backspace=2
se nocompatible
se mouse=a
se shiftround
se t_Co=256
se wrap

se backup
se backupdir=~/.vim/backup
se directory=~/.vim/tmp

se list listchars=tab:»·,trail:·
" Makefiles are hard to read when you display tabs
autocmd BufRead *Makefile* se nolist

filetype plugin on

au BufWritePost *.php !php -l <afile>
au BufWritePost *.rb !ruby -c <afile>

" return to the last position in a file when reopening
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

let mapleader = ","
let g:mapleader = ","

" enter key clears search highlighting
nnoremap <CR> :nohlsearch<cr>

map <leader>o :vertical wincmd f<CR>

" shows tab characters, etc
map <F3> :se list!<CR>
" removes whitespace from the ends of lines
map <F4> :%s/\s\+$//<CR>

:imap jj <Esc>

" diable the arrow keys
map <Left> :echo "no! Use H"<cr>
map <Right> :echo "no! Use L"<cr>
map <Up> :echo "no! Use K"<cr>
map <Down> :echo "no! Use J"<cr>

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

" hax to get crontab editing to work
set backupskip=/tmp/*,/private/tmp/*"

" vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'


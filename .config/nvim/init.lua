local Plug = vim.fn['plug#']
vim.fn['plug#begin']()

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-test/vim-test'

Plug('akinsho/bufferline.nvim', { tag = '*' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug 'neovim/nvim-lspconfig'
Plug('hrsh7th/cmp-nvim-lsp', { branch = 'main' })
Plug('hrsh7th/cmp-buffer', { branch = 'main' })
Plug('hrsh7th/nvim-cmp', { branch = 'main' })

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'onsails/lspkind-nvim'

Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.fn['plug#end']()

vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Do not ignore case with capitals
vim.opt.cursorline = true -- Do not ignore case with capitals
vim.opt.clipboard = 'unnamed'
vim.opt.winwidth = 85
vim.opt.colorcolumn = 80
vim.opt.mouse = 'a'
vim.opt.listchars = { tab = '»·', trail = '·' }
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.directory = '/tmp'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.cmd [[filetype plugin indent on]]

vim.cmd [[colorscheme base16-onedark]]

vim.g.mapleader = ','

vim.api.nvim_exec(
  [[
" open the file under the cursor
nnoremap <leader>o :vertical wincmd f<CR>

" search word under cursor
map <leader>f :Telescope lsp_references<CR>

" show problems with telescope
nnoremap <leader>d :Telescope diagnostics<CR>

" use telescope for ctrl+p search
nnoremap <silent> <c-p> :Telescope find_files<CR>

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

" maintain visual selection after indenting
vmap < <gv
vmap > >gv

" toggle commenting for selected lines
map <leader>/ <plug>NERDCommenterToggle<CR>
vmap <leader>/ <plug>NERDCommenterToggle<CR>gv


let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" shared clipboard for spin
if $SPIN == 1
    let g:clipboard = {
        \ 'name': 'pbcopy',
        \ 'copy': {'+': 'pbcopy', '*': 'pbcopy'},
        \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
        \ 'cache_enabled': 1 }
end
]],
  true
)

require('bufferline').setup {}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'python',
    'javascript',
    'rust',
    'ruby',
    'typescript',
    'go',
    'vim',
    'lua',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require('rust-tools').setup {}

local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = require('lspkind').cmp_format {},
  },
}

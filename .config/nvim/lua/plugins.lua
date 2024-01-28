local Plug = vim.fn['plug#']
vim.fn['plug#begin']()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

vim.fn['plug#end']()

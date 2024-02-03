local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
'tpope/vim-sensible',
'tpope/vim-fugitive',
'tpope/vim-rhubarb',
'tpope/vim-endwise',
'itchyny/lightline.vim',
'chriskempson/base16-vim',
'preservim/nerdcommenter',
'ervandew/supertab',
'airblade/vim-gitgutter',
'github/copilot.vim',
'nvim-lua/plenary.nvim',
'nvim-telescope/telescope.nvim',
'nvim-tree/nvim-web-devicons',
'folke/which-key.nvim',
'folke/trouble.nvim',

{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

-- lsp
'williamboman/mason.nvim',
'williamboman/mason-lspconfig.nvim',
'neovim/nvim-lspconfig',

-- completion
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
'hrsh7th/nvim-cmp',

'hrsh7th/cmp-vsnip',
'hrsh7th/vim-vsnip',
})

require("which-key").setup {}

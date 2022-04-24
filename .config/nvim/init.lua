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

-- open the file under the cursor
vim.keymap.set('n', '<leader>o', '<cmd>vertical wincmd f<cr>')

-- search word under cursor
vim.keymap.set('n', '<leader>f', '<cmd>Telescope lsp_references<cr>')

-- show problems with telescope
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')

-- use telescope for ctrl+p search
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')

-- use fugitive to show the blame
vim.keymap.set('n', '<leader>g', '<cmd>Git blame<cr>')

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- disable Ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- backslash to search within project
vim.keymap.set('n', '\\', '<cmd>Rg<cr>')

-- enter key clears search highlighting
vim.keymap.set('n', '<cr>', '<cmd>nohlsearch<cr>')

-- close quickfix
vim.keymap.set('n', '<space>', '<cmd>cclose<cr>')

-- Move around splits with <C-hjkl>
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr><cmd>wincmd =<cr>')

-- maintain visual selection after indenting
vim.keymap.set('v', '<', '<gv', { remap = true })
vim.keymap.set('v', '>', '>gv', { remap = true })

-- toggle commenting for selected lines
vim.keymap.set('', '<leader>/', '<plug>NERDCommenterToggle', { remap = true })
vim.keymap.set('v', '<leader>/', '<plug>NERDCommenterToggle<cr>gv', { remap = true })

vim.g.lightline = {
  colorscheme = 'one',
  component_function = {
    filename = 'LightlineFilename',
  },
  enable = {
    statusline = 1,
    tabline = 0,
  },
}

vim.api.nvim_exec(
  [[
  function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
      return path[len(root)+1:]
    endif
    return expand('%')
  endfunction
  ]],
  true
)

if os.getenv 'SPIN' == '1' then
  vim.g.clipboard = {
    name = 'pbcopy',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 1,
  }
end

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

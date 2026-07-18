vim.opt.number = true
vim.opt.clipboard = "unnamed"
vim.g.mapleader = ","
vim.opt.ts = 4
vim.opt.winwidth = 120
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.swapfile = false

vim.opt.complete:append("o")
vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "noinsert", "popup" }
vim.opt.autocomplete = true
vim.opt.pumborder = "rounded"

vim.pack.add({
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

vim.cmd("colorscheme catppuccin-macchiato")

require('lualine').setup({ sections = { lualine_b = { 'branch' }, lualine_x = { 'lsp_status' }, lualine_y = { 'diagnostics' } } })
require('snacks').setup({ indent = {} })

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam", "sorbet", "rubocop", "ts_ls", "zls" })

local s = vim.diagnostic.severity
vim.diagnostic.config({ signs = { text = { [s.ERROR] = "", [s.WARN] = "", [s.HINT] = "", [s.INFO] = "", } } })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- pickers
vim.keymap.set('n', '<c-p>', function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set('n', '\\', function() Snacks.picker.grep({ hidden = true }) end)
vim.keymap.set('n', '<leader>d', Snacks.picker.diagnostics)
vim.keymap.set('n', '<leader>r', Snacks.picker.lsp_references)
vim.keymap.set('n', '<leader>s', Snacks.picker.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>b', Snacks.picker.buffers)

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- lsp keys
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>t', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

-- Move around splits with <C-hjkl>
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr><cmd>wincmd =<cr>')

-- maintain visual selection after indenting
vim.keymap.set('v', '<', '<gv', { remap = true })
vim.keymap.set('v', '>', '>gv', { remap = true })

-- close quickfix
vim.keymap.set('n', '<space>', '<cmd>cclose<cr>')

-- clear search highlighting
vim.keymap.set('n', '<leader>c', '<cmd>nohlsearch<cr>')

-- git stuff
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>g', gitsigns.blame)
vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end)
vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end)
vim.api.nvim_create_user_command('Gbrowse', function(_) Snacks.gitbrowse() end, {})

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

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/trouble.nvim",
})

vim.cmd("colorscheme catppuccin-macchiato")

require('lualine').setup({
	sections = {
		lualine_b = { 'branch', 'diff' },
		lualine_c = { { "filetype", icon_only = true, separator = "", padding = { left = 1 } }, { 'filename', path = 1 }, },
		lualine_x = { 'lsp_status' },
		lualine_y = { 'diagnostics' }
	}
})

require("trouble").setup()
require('snacks').setup({ indent = {} })
require("blink.cmp").setup({ keymap = { preset = 'enter' }, signature = { enabled = true } })

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam", "sorbet", "rubocop", "ts_ls" })

local sev = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = true,
	signs = { text = { [sev.ERROR] = "", [sev.WARN] = "", [sev.HINT] = "", [sev.INFO] = "", } },
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- pickers
vim.keymap.set('n', '<c-p>', function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set('n', '\\', function() Snacks.picker.grep({ hidden = true }) end)
vim.keymap.set('n', '<leader>d', '<cmd>Trouble diagnostics toggle focus=true<cr>')
vim.keymap.set('n', '<leader>r', Snacks.picker.lsp_references)
vim.keymap.set('n', '<leader>s', Snacks.picker.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>b', Snacks.picker.buffers)
vim.keymap.set('n', '<leader>e', function() Snacks.picker.explorer({ hidden = true }) end)

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

-- enter key clears search highlighting
vim.keymap.set('n', '<cr>', '<cmd>nohlsearch<cr>')
-- but not for quickfix
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "quickfix" },
	callback = function() vim.keymap.set('n', '<CR>', '<CR>', { buffer = true }) end
})

-- git stuff
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>g', gitsigns.blame)
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', ']c', '<cmd>Gitsigns nav_hunk next<cr>')
vim.keymap.set('n', '[c', '<cmd>Gitsigns nav_hunk prev<cr>')
vim.api.nvim_create_user_command('Gbrowse', function(_) Snacks.gitbrowse() end, {})

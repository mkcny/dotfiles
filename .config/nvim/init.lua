vim.opt.number = true
vim.opt.clipboard = "unnamed"
vim.g.mapleader = ","
vim.opt.ts = 4
vim.opt.winwidth = 120
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.pack.add({
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/snacks.nvim",
})

vim.cmd("colorscheme catppuccin-macchiato")

require('lualine').setup({
	sections = {
		lualine_b = { 'branch', 'diff' },
		lualine_c = { { "filetype", icon_only = true, separator = "", padding = { left = 1 } }, { 'filename', path = 1 }, },
		lualine_x = { 'lsp_status', 'diagnostics' }
	}
})

require("ibl").setup()
require('snacks')

require("blink.cmp").setup({
	keymap = {
		preset = 'enter',
		['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
	},
	signature = { enabled = true }
})

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam", "sorbet", "rubocop", "ts_ls" })
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

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

-- enter key clears search highlighting
vim.keymap.set('n', '<cr>', '<cmd>nohlsearch<cr>')

-- git stuff
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>g', gitsigns.blame)
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', ']c', '<cmd>Gitsigns nav_hunk next<cr>')
vim.keymap.set('n', '[c', '<cmd>Gitsigns nav_hunk prev<cr>')
vim.api.nvim_create_user_command('Gbrowse', 'lua Snacks.gitbrowse()', {})

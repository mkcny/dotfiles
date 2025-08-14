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
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
	"https://github.com/lewis6991/gitsigns.nvim",
})

vim.cmd("colorscheme catppuccin-macchiato")

require('lualine').setup({ sections = { lualine_x = { 'lsp_status', 'filetype' } } })
require("ibl").setup()
require("blink.cmp").setup({
	keymap = {
		preset = 'enter',
		['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
	},
	signature = { enabled = true }
})

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam" })
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

-- telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true<cr>')
vim.keymap.set('n', '\\', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- show git blame
vim.keymap.set('n', '<leader>g', '<cmd>Git blame<cr>')

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- lsp keys
vim.keymap.set('n', '<c-.>', "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set('n', '<leader>t', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')

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

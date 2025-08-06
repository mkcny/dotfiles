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
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
	"https://github.com/echasnovski/mini.diff",
})

require('mini.diff').setup()
require('lualine').setup({})
require("ibl").setup()

require("blink.cmp").setup({
	keymap = {
		preset = 'enter',
		['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
	},
	signature = { enabled = true }
})

require('nvim-treesitter.configs').setup({
	ensure_installed = { "lua", "rust", "gleam", "ruby", "go", "toml" },
	highlight = { enable = true },
})

vim.cmd("colorscheme catppuccin-macchiato")

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam", "taplo", "ruby_lsp" })
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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

vim.lsp.config('rust_analyzer', {
	settings = {
		["rust-analyzer"] = {
			cargo = { features = "all" },
			checkOnSave = { command = "clippy" },
		},
	},
})

-- telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files hidden=true<cr>')
vim.keymap.set('n', '\\', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- toggle inlay type hints
vim.keymap.set('n', '<leader>t', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- lsp keys
vim.keymap.set('n', '<c-.>', "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<cr>")

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

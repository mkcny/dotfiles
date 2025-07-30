vim.opt.number = true
vim.opt.clipboard = "unnamed"
vim.g.mapleader = ","
vim.opt.ts = 4

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/echasnovski/mini.comment",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/folke/tokyonight.nvim",
})

vim.cmd("colorscheme tokyonight-moon")

vim.lsp.enable({ "lua_ls", "rust_analyzer", "gleam" })
vim.diagnostic.config({ virtual_lines = true })
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

require('nvim-treesitter.configs').setup({
	ensure_installed = { "lua", "rust", "gleam", "ruby", "go" },
})

require("ibl").setup()

require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	keymap = {
		preset = 'enter',
		['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
	},
})

-- telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '\\', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- toggle inlay type hints
vim.keymap.set('n', '<leader>t', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- lsp code actions
vim.keymap.set('n', '<c-.>', "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- Move around splits with <C-hjkl>
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr><cmd>wincmd =<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr><cmd>wincmd =<cr>')

-- maintain visual selection after indenting
vim.keymap.set('v', '<', '<gv', { remap = true })
vim.keymap.set('v', '>', '>gv', { remap = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- easier quitting
vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")

-- ctrl+p for file search
vim.keymap.set("n", "<c-p>", "<cmd>lua LazyVim.pick()()<cr>")

-- backslack to search within project
vim.keymap.set("n", "\\", '<cmd>lua LazyVim.pick("live_grep")()<cr>')

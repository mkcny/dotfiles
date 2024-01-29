vim.g.mapleader = ','

-- open the file under the cursor
--vim.keymap.set('n', '<leader>o', '<cmd>vertical wincmd f<cr>')

-- search word under cursor
--vim.keymap.set('n', '<leader>f', '<cmd>Telescope lsp_references<cr>')

-- show problems with telescope
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')

-- use telescope for ctrl+p search
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')

-- use fugitive to show the blame
vim.keymap.set('n', '<leader>g', '<cmd>Git blame<cr>')

-- easier quitting
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')

-- disable Ex mode
--vim.keymap.set('n', 'Q', '<nop>')

-- backslash to search within project
vim.keymap.set('n', '\\', '<cmd>Telescope live_grep<cr>')

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

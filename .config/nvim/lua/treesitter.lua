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

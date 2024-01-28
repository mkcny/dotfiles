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

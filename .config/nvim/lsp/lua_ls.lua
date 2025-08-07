return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { 'init.lua', '.luarc.json', '.luarc.jsonc', '.git' },
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
}

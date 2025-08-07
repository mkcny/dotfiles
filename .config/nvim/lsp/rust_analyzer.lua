return {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	settings = {
		["rust-analyzer"] = {
			cargo = { features = "all" },
			checkOnSave = { command = "clippy" },
		},
	},
}

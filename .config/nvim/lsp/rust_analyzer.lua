return {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	settings = {
		["rust-analyzer"] = {
			cargo = { features = "all" },
			checkOnSave = true,
			check = { command = "clippy" },
		},
	},
}

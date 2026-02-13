return {
	"crnvl96/lazydocker.nvim",
	opts = {}, -- automatically calls `require("lazydocker").setup()`
	keys = {
		{
			"<leader>dd",
			"<Cmd>lua require('lazydocker').toggle({ engine = 'docker' })<CR>",
			desc = "LazyDocker (docker)",
		},
	},
}

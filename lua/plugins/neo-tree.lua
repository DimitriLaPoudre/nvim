vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("neo-tree").setup({
	filesystem = {
		window = {
			mappings = {
				["h"] = "close_node",
				["l"] = "open",
			},
		},
	},

	event_handlers = {
		{
			event = "file_opened",
			handler = function(_)
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
})

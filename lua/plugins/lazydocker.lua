vim.pack.add({
	{
		src = "https://github.com/crnvl96/lazydocker.nvim",
	},
})

require("lazydocker").setup({
	window = {
		settings = {
			width = 0.9, -- Percentage of screen width (0 to 1)
			height = 0.9, -- Percentage of screen height (0 to 1)
			border = 'rounded', -- See ':h nvim_open_win' border options
			relative = 'editor', -- See ':h nvim_open_win' relative options
		},
	},
})

vim.keymap.set("n", "<leader>dd", function()
	require("lazydocker").toggle({
		engine = "docker",
	})
end, {
	desc = "LazyDocker (docker)",
})

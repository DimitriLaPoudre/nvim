vim.pack.add({
	{
		src = "https://github.com/crnvl96/lazydocker.nvim",
	},
})

require("lazydocker").setup({})

vim.keymap.set("n", "<leader>dd", function()
	require("lazydocker").toggle({
		engine = "docker",
	})
end, {
	desc = "LazyDocker (docker)",
})

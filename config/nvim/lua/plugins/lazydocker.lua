vim.pack.add({
	{ src = "https://github.com/mgierada/lazydocker.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("lazydocker").setup({
	border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
	width = 0.9,    -- width of the floating window (0-1 for percentage, >1 for absolute columns)
	height = 0.9,   -- height of the floating window (0-1 for percentage, >1 for absolute rows)
})

vim.keymap.set("n", "<leader>dd", function()
	require("lazydocker").open()
end, {
	desc = "LazyDocker (docker)",
})

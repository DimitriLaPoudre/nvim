vim.pack.add({
	{ src = "https://github.com/LostbBlizzard/lazysql.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

require("lazysql").setup()

vim.keymap.set("n", "<leader>DD", "<cmd>LazySql<CR>", {
	desc = "LazySql",
})

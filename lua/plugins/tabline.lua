vim.g.barbar_auto_setup = false

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{
		src = "https://github.com/romgrk/barbar.nvim",
		version = vim.version.range('^1'),
	},
})

require("barbar").setup({})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>")

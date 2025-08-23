return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- ⚙️ Options que tu peux personnaliser :
			size = 15,
			open_mapping = [[<C-\>]], -- toggle avec Ctrl + \
			direction = "horizontal", -- "vertical" | "float" | "tab"
			shade_terminals = true,
			start_in_insert = true,
			persist_size = true,
			persist_mode = true,
			shell = vim.o.shell, -- ton shell (bash, zsh, fish, etc.)
		})
	end,
}

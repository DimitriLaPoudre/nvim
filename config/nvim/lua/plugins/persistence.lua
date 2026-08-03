vim.pack.add({
	{ src = "https://github.com/folke/persistence.nvim" },
})

require("persistence").setup({
	dir = vim.fn.expand("~/.local/share/nvim/sessions/"),
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
	callback = function()
		if vim.fn.getcwd() ~= vim.env.HOME then
			require("persistence").load()
		end
	end,
	nested = true,
})

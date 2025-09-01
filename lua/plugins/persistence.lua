vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
	callback = function()
		require("persistence").load({ last = true })
	end,
	nested = true,
})

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/",
		need = 0,
		branch = true,
		options = { "buffers", "curdir", "folds", "tabpages", "winsize", "winpos", "terminal", "localoption" },
	},
	keys = {
		{ "<leader>qs", function() require("persistence").load() end,                desc = "Restaurer la session" },
		{ "<leader>qS", function() require("persistence").select() end,              desc = "Sélectionner une session" },
		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restaurer la dernière session" },
		{ "<leader>qd", function() require("persistence").stop() end,                desc = "Ne pas enregistrer la session actuelle" },
	},
}

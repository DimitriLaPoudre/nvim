return {
	"olimorris/persisted.nvim",
	event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
	opts = {
		-- Your config goes here ...
		use_git_branch = true,
		autoload = true,
	},
	keys = {
		{ "<leader>qs", "<cmd>SessionSelect<CR>",   desc = "Sélectionner une session" },
		{ "<leader>ql", "<cmd>SessionLoadLast<CR>", desc = "Restaurer la dernière session" },
		{ "<leader>qd", "<cmd>SessionDelete<CR>",   desc = "Ne pas enregistrer la session actuelle" },
	},
}

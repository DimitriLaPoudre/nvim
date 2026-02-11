return {
	"olimorris/persisted.nvim",
	event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
	opts = {
		-- Your config goes here ...
		use_git_branch = true,
		autoload = true,
	},
	keys = {
		{ "<leader>qs", "<cmd>Persisted select<CR>", desc = "Sélectionner une session" },
		{ "<leader>ql", "<cmd>Persisted load_last<CR>", desc = "Restaurer la dernière session" },
		{ "<leader>qd", "<cmd>Persisted delete<CR>", desc = "Ne pas enregistrer la session actuelle" },
	},
}

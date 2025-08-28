-- lua/plugins/spectre.lua
return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
		{
			"<leader>sw",
			"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
			desc = "Search current word",
		},
		{
			"<leader>sp",
			"<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
			desc = "Search in current file",
		},
	},
	config = function()
		require("spectre").setup({
			color_devicons = true,
			open_cmd = "vnew", -- Peut aussi être une fonction Lua
			live_update = true, -- Exécute automatiquement la recherche lors de l'écriture dans un fichier
			lnum_for_results = true, -- Affiche le numéro de ligne pour les résultats de recherche/remplacement
			line_sep_start = "┌──────────────────────────────────────────────────────────────┐",
			line_sep = "├──────────────────────────────────────────────────────────────┤",
			line_sep_last = "└──────────────────────────────────────────────────────────────┘",
			result_padding = "   ",
			highlight = {
				ui = "String",
				search = "DiffAdd",
				replace = "DiffDelete",
			},
			mapping = {
				["toggle_line"] = "<CR>", -- Basculer la ligne de résultat
				["toggle_word"] = "w", -- Basculer le mot de résultat
				["send_to_qf"] = "q", -- Envoyer à la liste de quickfix
				["replace_cmd"] = "<leader>r", -- Remplacer dans le fichier
				["replace_cmd_in"] = "<leader>R", -- Remplacer dans les fichiers sélectionnés
				["show_help"] = "?", -- Afficher l'aide
			},
		})
	end,
}

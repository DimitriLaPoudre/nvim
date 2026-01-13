-- ~/.config/nvim/lua/plugins/visual_multi.lua
return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		lazy = false, -- charger au démarrage
		config = function()
			-- Paramètres optionnels
			vim.g.VM_default_mappings = 1 -- activer les mappings par défaut
			vim.g.VM_theme = "blue"   -- couleur des cursors
			vim.g.VM_maps = {
				["Find Under"] = "<C-n>", -- sélectionne le mot sous le curseur / sélection
				["Find Subword Under"] = "<C-n>", -- idem pour les sous-mots
				["Select All"] = "<C-A>", -- sélectionne toutes les occurrences
			}
		end,
	},
}

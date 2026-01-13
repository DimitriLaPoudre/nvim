return {
	-- none-ls (fork de null-ls)
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local nls = require("null-ls")

			nls.setup({
				-- sources si tu veux définir certains ici
				sources = {},
			})
		end,
	},

	-- Mason → permet à mason-null-ls d’installer des linters/formatters
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {}, -- liste des outils que tu veux que Mason installe
				automatic_setup = true, -- si tu veux que mason-null-ls essaye de les enregistrer
				handlers = {}, -- handlers pour config personnalisée (vide = default)
			})
		end,
	},
}

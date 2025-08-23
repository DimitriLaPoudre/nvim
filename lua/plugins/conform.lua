return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			cpp = { "clang_format" },
			c = { "clang_format" },
			h = { "clang_format" }, -- Ajout de .h
			hpp = { "clang_format" }, -- Ajout de .hpp
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				require("conform").format({ async = false })
			end,
		})
	end,
}

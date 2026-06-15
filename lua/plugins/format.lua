vim.pack.add({
	{ src = 'https://github.com/stevearc/conform.nvim' },
})

require("conform").setup({
	notify_on_error = false,

	format_on_save = function(bufnr)
		local disable_filetypes = {
			-- c = true,
			-- cpp = true,
		}

		if disable_filetypes[vim.bo[bufnr].filetype] then
			return nil
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,

	formatters_by_ft = {
		-- python = { "isort", "black" },
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, {
	desc = "[F]ormat buffer",
})

-- Setup LSP
vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
})

-- Add each lsp server you want to enable here
-- Add the config to the lsp folder
-- Each LSP server will be added by Mason and enabled
-- local lsp_servers = {
--   'pylsp',
--   'clangd',
--   'rust_analyzer',
--   'lua_ls',
-- }

-- Configuration for LSP
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = { globals = { 'vim' } },
		},
	},
})

-- Enable LSP completion for non-mason lsp since mason auto enable
-- vim.lsp.enable(lsp_servers)

-- Keymaps for LSP most of them are in snacks for the picker
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local bufnr = args.buf

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- map('n', '<leader>cf', function()
		--   vim.lsp.buf.format({ async = true })
		-- end, 'Format buffer')
	end,
})

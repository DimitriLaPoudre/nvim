-- return {
-- 	"olimorris/persisted.nvim",
-- 	event = "BufReadPre",
-- 	opts = {
-- 		use_git_branch = true,
-- 		autoload = true,
-- 	},
-- 	config = {
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "PersistedSavePre",
-- 			callback = function()
-- 				pcall(function()
-- 					require("neo-tree.command").execute({ action = "close" })
-- 				end)
--
-- 				-- pcall(function()
-- 				-- 	local terms = require("toggleterm.terminal").get_all()
-- 				-- 	if terms and #terms > 0 then
-- 				-- 		vim.cmd("ToggleTermToggleAll")
-- 				-- 	end
-- 				-- end)
-- 			end,
-- 		}),
--
-- 		vim.api.nvim_create_autocmd("VimLeavePre", {
-- 			callback = function()
-- 				require("persisted").save()
-- 			end,
-- 		}),
--
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "PersistedLoadPre",
-- 			callback = function()
-- 				-- require("persisted").save({ session = vim.g.persisted_session })
-- 				vim.cmd("noautocmd %bd!")
-- 			end,
-- 		})
-- 	},
-- 	-- keys = {
-- 	-- { "<leader>qs", "<cmd>Persisted select<CR>",    desc = "Sélectionner une session" },
-- 	-- { "<leader>ql", "<cmd>Persisted load_last<CR>", desc = "Restaurer la dernière session" },
-- 	-- { "<leader>qd", "<cmd>Persisted delete<CR>",    desc = "Ne pas enregistrer la session actuelle" },
-- 	-- },
-- }

return {
	"folke/persistence.nvim",
	opts = {
		dir = vim.fn.expand("~/.local/share/nvim/sessions/"),
	},
	config = {
		vim.api.nvim_create_autocmd("VimEnter", {
			group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
			callback = function()
				if vim.fn.getcwd() ~= vim.env.HOME then
					require("persistence").load()
				end
			end,
			nested = true,
		})
	},
}

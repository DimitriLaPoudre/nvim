vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
return {
	{
		"rmagatti/auto-session",
		lazy = false,

		config = function()
			require("auto-session").setup({
				auto_restore = true,
				auto_save = true,
				auto_session_enable_last_session = true,
				log_level = "info",
				session_lens = {
					picker = "telescope",
					mappings = {
						delete_session = { "i", "<C-d>" },
						alternate_session = { "i", "<C-s>" },
						copy_session = { "i", "<C-y>" },
					},
				},
			})
		end,
	},
}

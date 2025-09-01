return {
	"gbprod/yanky.nvim",
	dependencies = { "kkharji/sqlite.lua", "nvim-telescope/telescope.nvim" },
	opts = {
		highlight = {
			timer = 150,
		},
		preserve_cursor_position = { enabled = true },
		ring = {
			history_length = 100,
			storage = "sqlite",
			sync_with_numbered_registers = true,
		},
		picker = {
			select = {
				action = nil,
			},
			telescope = {
				mappings = nil,
			},
		},
	},
	keys = {
		{ "p",         "<Plug>(YankyPutAfter)",           mode = { "n", "x" } },
		{ "P",         "<Plug>(YankyPutBefore)",          mode = { "n", "x" } },
		{ "<c-n>",     "<Plug>(YankyCycleForward)" },
		{ "<c-p>",     "<Plug>(YankyCycleBackward)" },
		{ "<leader>p", "<cmd>Telescope yank_history<cr>", desc = "Historique des yanks" },
	},
	config = function(_, opts)
		require("yanky").setup(opts)
	end,
}

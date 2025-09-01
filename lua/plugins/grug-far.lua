vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('grug-far-keybindings', { clear = true }),
	pattern = { 'grug-far' },
	callback = function()
		vim.keymap.set('n', '<C-c>', function()
			require('grug-far').get_instance(0):close()
		end, { buffer = true, desc = 'Fermer le buffer GrugFar' })
	end,
})

return {
	"MagicDuck/grug-far.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>r", "<cmd>lua require('grug-far').open({})<CR>", desc = "Ouvrir GrugFar" },
		{
			"<leader>rw",
			"<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
			desc = "Rechercher le mot sous le curseur",
		},
		{
			"<leader>rp",
			"<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Rechercher dans le fichier actuel",
		},
	},
	config = function()
		require("grug-far").setup({
			-- Configuration optionnelle ici
		})
	end,
}

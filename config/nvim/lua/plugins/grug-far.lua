vim.pack.add({
	{
		src = "https://github.com/MagicDuck/grug-far.nvim",
	},
})

local gf = require("grug-far")

gf.setup({})

-- Keymaps
vim.keymap.set("n", "<leader>r", function()
	gf.open({})
end, { desc = "Ouvrir GrugFar" })

vim.keymap.set("n", "<leader>rw", function()
	gf.open({
		prefills = { search = vim.fn.expand("<cword>") },
	})
end, { desc = "Rechercher le mot sous le curseur" })

vim.keymap.set("n", "<leader>r/", function()
	gf.open({
		prefills = { paths = vim.fn.expand("%") },
	})
end, { desc = "Rechercher dans le fichier actuel" })

-- Autocmds
vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('grug-far-keybindings', { clear = true }),
	pattern = { 'grug-far' },
	callback = function()
		vim.keymap.set('n', '<C-c>', function()
			gf.get_instance(0):close()
		end, { buffer = true, desc = 'Fermer le buffer GrugFar' })
	end,
})

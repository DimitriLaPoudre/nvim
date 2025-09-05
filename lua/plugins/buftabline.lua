return {
	"ap/vim-buftabline",
	event = "VeryLazy",
	config = function()
		vim.g.buftabline_show = 1
		vim.g.buftabline_numbers = 1
		vim.g.buftabline_modified_icon = "*"
		vim.g.buftabline_icon = ""
	end,
}

return {
	"rcarriga/nvim-notify",
	dependencies = { 'nvim-telescope/telescope.nvim' },
 	lazy = false,
	
	config = function()
    	local notify = require("notify")
    
   		notify.setup({
      		background_colour = "#000000",
      		fps = 30,
      		render = "wrapped-compact",
			stages = "fade",
      		timeout = 1000,
      		top_down = false,
    	})
    
    	vim.notify = notify,
		require("telescope").load_extension("notify")
  	end,

	keys = {
    	{ "<leader>sn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
  	}
}

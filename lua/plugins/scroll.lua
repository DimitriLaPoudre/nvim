vim.pack.add({
	{
		src = "https://github.com/karb94/neoscroll.nvim",
	},
})

require("neoscroll").setup({
  hide_cursor = false,
  stop_eof = true,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  duration_multiplier = 1.0,
  easing = "linear",
  pre_hook = nil,
  post_hook = nil,
  performance_mode = false,
  ignored_events = {
    "WinScrolled",
    "CursorMoved",
  },
})

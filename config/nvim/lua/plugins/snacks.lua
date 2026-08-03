vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local Snacks = require("snacks")
Snacks.setup({
	-- animate = { enabled = true },
	-- bigfile = {
	-- 	enabled = true,
	-- 	size = 1.5 * 1024 * 1024, -- 1.5MB threshold
	-- 	setup = function(ctx)
	-- 		-- Disable treesitter (disables highlights, folds, indentexpr)
	-- 		vim.cmd("syntax clear")
	-- 		vim.treesitter.stop(ctx.buf)
	-- 		vim.wo.foldmethod = "manual"
	-- 		vim.wo.foldexpr = ""
	--
	-- 		-- Disable LSP features that are expensive on large files
	-- 		vim.schedule(function()
	-- 			vim.lsp.inlay_hint.enable(false, { bufnr = ctx.buf })
	-- 			vim.lsp.document_color.enable(false, { bufnr = ctx.buf })
	-- 		end)
	--
	-- 		-- Keep diagnostics off for huge files
	-- 		vim.diagnostic.enable(false, { bufnr = ctx.buf })
	--
	-- 		-- Disable indent guides
	-- 		vim.b[ctx.buf].snacks_indent = false
	-- 	end,
	-- },
	-- dashboard = { enabled = false },
	-- dim = { enabled = true },
	-- explorer = { enabled = true, replace_netrw = true },
	image = { enabled = true },
	indent = { enabled = true },
	lazygit = { enabled = true },
	-- input = { enabled = true },
	-- layout = { enabled = true },
	-- notifier = { enabled = true },
	-- quickfile = { enabled = true },
	-- scope = { enabled = true },
	scratch = { enabled = true },
	-- scroll = { enabled = true },
	-- statuscolumn = { enabled = true },
	-- terminal = { enabled = true },
	-- toggle = { enabled = true },
	-- words = { enabled = false },
	-- zen = { enabled = true },
	picker = {
		sources = {
			files = {
				hidden = true,
				ignored = true,

				win = {
					input = {
						keys = {
							["<S-h>"] = "toggle_hidden",
							["<C-y>"] = { "yazi_copy_relative_path", mode = { "n", "i" } },
						},
					},
				},
				exclude = {
					"**/.git/*",
					"**/node_modules/*",
					"build/*",
					"**/.venv/*",
					"coverage/*",
					"dist/*",
					"**/target/*",
				},
			},
			grep = {
				hidden = true,
				ignored = true,
				win = {
					input = {
						keys = {
							["<S-h>"] = "toggle_hidden",
						},
					},
				},
				exclude = {
					"**/.git/*",
					"**/node_modules/*",
					"build/*",
					"**/.venv/*",
					"coverage/*",
					"dist/*",
					"**/target/*",
				},
			},
			grep_buffers = {},
		},
	},
})

-- stylua: ignore start
local keymaps = {
	-- Top Pickers & Explorer
	{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
	{ "<leader>/",       function() Snacks.picker.lines() end,                                   desc = "Fuzzy find in current buffer" },
	{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
	-- { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
	-- { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
	-- find
	{ "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
	{ "<leader>fn",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Neovim config files" },
	{ "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
	{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
	{ "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
	{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
	-- git
	{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
	{ "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
	{ "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
	{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
	{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
	{ "<leader>gp",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff Picker (Hunks)" },
	{ "<leader>gP",      function() Snacks.picker.git_diff({ base = "origin" }) end,             desc = "Git Diff Picker (origin)" },
	{ "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
	-- Grep
	{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
	{ "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
	{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",    mode = { "n", "x" } },
	-- search
	{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
	{ '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
	{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
	{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
	{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
	{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
	{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
	{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
	{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
	-- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
	{ "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
	{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
	{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
	{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
	{ "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
	{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
	{ "<leader>sT",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
	-- LSP
	{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
	{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
	{ "gR",              function() Snacks.picker.lsp_references() end,                          nowait = true,                        desc = "References" },
	{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
	{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
	{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
	{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
	{ "gai",             function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming",            has = "callHierarchy/incomingCalls" },
	{ "gao",             function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing",            has = "callHierarchy/outgoingCalls" },
	-- buffers
	{ "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete buffer",               mode = { "n" }, },
	-- { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers", mode = { "n" }, },
	-- Other
	{ "<leader>.",       function() Snacks.scratch({ ft = "markdown" }) end,                     desc = "Toggle Scratch Buffer" },
	{ "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
	{ "<leader>br",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
	{ "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
}
-- stylua: ignore end
for _, map in ipairs(keymaps) do
	local opts = { desc = map.desc }
	if map.silent ~= nil then
		opts.silent = map.silent
	end
	if map.noremap ~= nil then
		opts.noremap = map.noremap
	else
		opts.noremap = true
	end
	if map.expr ~= nil then
		opts.expr = map.expr
	end

	local mode = map.mode or "n"
	vim.keymap.set(mode, map[1], map[2], opts)
end

return {
	{
		"christoomey/vim-tmux-navigator",

		keys = {
			{ "<C-h>", "<Cmd><C-u>TmuxNavigateLeft<Enter>" },
			{ "<C-j>", "<Cmd><C-u>TmuxNavigateDown<Enter>" },
			{ "<C-k>", "<Cmd><C-u>TmuxNavigateUp<Enter>" },
			{ "<C-l>", "<Cmd><C-u>TmuxNavigateRight<Enter>" },
			{ "<C-\\>", "<Cmd><C-u>TmuxNavigatePrevious<Enter>" },
		},
	},
	{
		"rmagatti/auto-session",

		opts = {
			suppressed_dirs = { "/", "~/", "~/Downloads" },
			-- log_level = "debug",
		},
	},
}

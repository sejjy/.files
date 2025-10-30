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

		lazy = false,

		keys = {
			{
				"<Leader>ss",
				":AutoSession search<Enter>",
				desc = "search [s]essions",
			},
		},

		opts = {
			suppressed_dirs = { "/", "~/", "~/Downloads" },
			-- log_level = "debug",

			session_lens = {
				picker_opts = {
					-- stylua: ignore
					layout = {
						box = "horizontal",
						backdrop = false,
						width = 0.8,
						height = 0.9,
						border = "none",
						{
							box = "vertical",
							{ win = "list", title = " Results ", title_pos = "center", border = "single" },
							{ win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
						},
						{ win = "preview", title = "{preview:Preview}", width = 0.45, border = "single", title_pos = "center" },
					},
				},
			},
		},
	},
}

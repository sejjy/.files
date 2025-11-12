return {
	"A7Lavinraj/fyler.nvim",

	keys = {
		{ "<Leader>e", ":Fyler<Enter>", desc = "[e]xplorer", silent = true },
	},

	opts = {
		views = {
			finder = {
				default_explorer = true,

				git_status = {
					symbols = {
						Untracked = "??",
						Added = " A",
						Modified = " M",
						Deleted = " D",
						Renamed = " R",
						Copied = " C",
						Conflict = "!!",
						Ignored = "--",
					},
				},

				icon = {
					directory_collapsed = "󰉋",
					directory_expanded = "󰝰",
				},

				win = {
					kind = "float",
					kinds = {
						float = {
							width = "22%",
							height = "90%",
							top = "0%",
							left = "100%",
						},
					},
					win_opts = {
						winhighlight = "Normal:NormalFloat",
						cursorline = true,
						number = true,
						relativenumber = true,
					},
				},
			},
		},
	},
}

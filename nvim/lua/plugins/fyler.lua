return {
	"A7Lavinraj/fyler.nvim",

	branch = "stable",

	keys = {
		{ "<Leader>e", ":Fyler<Enter>", desc = "[e]xplorer", silent = true },
	},

	opts = {
		views = {
			finder = {
				default_explorer = true,

				icon = {
					directory_collapsed = "󰉋",
					directory_expanded = "󰝰",
				},

				win = {
					kind = "float",
					kinds = {
						float = {
							width = "37",
							height = "90%",
							top = "0",
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

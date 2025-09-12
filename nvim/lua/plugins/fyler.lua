return {
	"A7Lavinraj/fyler.nvim",

	keys = {
		{ "<Leader>e", ":Fyler<Enter>", desc = "[e]xplorer" },
	},

	opts = {
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
			kind_presets = {
				float = {
					width = "37abs",
					height = "0.9rel",
					left = "none",
					right = "0abs",
					top = "0abs",
				},
			},
			win_opts = { winhighlight = "Normal:NormalFloat" },
		},
	},
}

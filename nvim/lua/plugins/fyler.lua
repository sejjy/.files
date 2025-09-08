return {
	"A7Lavinraj/fyler.nvim",

	keys = {
		{ "<Leader>e", ":Fyler<Enter>", desc = "[e]xplorer" },
	},

	opts = {
		default_explorer = true,
		win = {
			kind = "float",
			kind_presets = {
				float = {
					width = "35abs",
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

return {
	"esmuellert/vscode-diff.nvim",

	enabled = false,

	dependencies = { "MunifTanjim/nui.nvim" },

	cmd = "CodeDiff",

	keys = {
		{ "<Leader>v", ":CodeDiff<Enter>", desc = "[v]iew diff" },
	},

	config = function()
		require("vscode-diff").setup({
			explorer = {
				view_mode = "tree",
				position = "right",
				width = 38,
				indent_markers = true,

				icons = {
					folder_closed = "󰉋",
					folder_open = "󰝰",
				},
			},
		})
	end,
}

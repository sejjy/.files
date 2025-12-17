return {
	"esmuellert/vscode-diff.nvim",

	dependencies = { "MunifTanjim/nui.nvim" },

	cmd = "CodeDiff",

	keys = {
		{ "<Leader>v", ":CodeDiff<Enter>", desc = "[v]scode-diff" },
	},
}

return {
	{
		"catppuccin/nvim",

		name = "catppuccin",

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				styles = { comments = {} },
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"vague-theme/vague.nvim",

		enabled = false,

		lazy = false,

		priority = 1000,

		config = function()
			require("vague").setup({
				bold = false,
				italic = false,
			})
			-- vim.cmd.colorscheme("vague")
		end,
	},
	{
		"projekt0n/github-nvim-theme",

		enabled = false,

		name = "github-theme",

		lazy = false,

		priority = 1000,

		config = function()
			require("github-theme").setup({})
			-- vim.cmd.colorscheme("github_dark_default")
		end,
	},
}

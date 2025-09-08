return {
	"catppuccin/nvim",

	version = "v1.11.0",

	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			styles = { comments = {} },
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

return {
	"catppuccin/nvim",

	name = "catppuccin",

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			styles = { comments = {} },
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

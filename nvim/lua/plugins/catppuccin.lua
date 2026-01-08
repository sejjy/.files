return {
	"catppuccin/nvim",

	-- version = "v1.11.0",

	name = "catppuccin",

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			no_italic = true,
			no_bold = true,

			color_overrides = {
				mocha = {
					base = "#181825",
					mantle = "#11111b",
					crust = "#000000",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}

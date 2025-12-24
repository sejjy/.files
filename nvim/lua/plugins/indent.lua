return {
	"saghen/blink.indent",

	event = "BufReadPost",

	config = function()
		local indent = require("blink.indent")

		vim.keymap.set("n", "<Leader>ti", function()
			indent.enable(not indent.is_enabled())
		end, { desc = "toggle [i]ndent guides" })

		local mocha = require("catppuccin.palettes").get_palette("mocha")
		vim.api.nvim_set_hl(0, "BlinkIndentFocused", { default = true, fg = mocha.overlay2 })
		vim.api.nvim_set_hl(0, "BlinkIndentFocusedUnderline", { default = true, sp = mocha.overlay2, underline = true })

		indent.setup({
			static = {
				enabled = true,
				char = "▏",
				highlights = { "BlinkIndent" },
			},

			scope = {
				enabled = true,
				char = "▏", -- "▎"
				highlights = { "BlinkIndentFocused" },

				underline = {
					enabled = true,
					highlights = { "BlinkIndentFocusedUnderline" },
				},
			},
		})
	end,
}

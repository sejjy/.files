return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
			return function(str)
				local win_width = vim.fn.winwidth(0)
				if hide_width and win_width < hide_width then
					return ""
				elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
					return str:sub(1, trunc_len) .. (no_ellipsis and "" or "…")
				end
				return str
			end
		end

		local mocha = require("catppuccin.palettes").get_palette("mocha")

		require("lualine").setup({
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = " " },
						fmt = trunc(80, 1, 0, true),
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "󰘬",
						color = { fg = mocha.text },
						padding = { right = 1 },
						separator = { right = " " },
					},
				},

				lualine_c = {
					{
						"filetype",
						icon_only = true,
						color = { bg = mocha.mantle },
						padding = 0,
						separator = "",
					},
					{
						"filename",
						padding = { right = 1 },
						separator = ":",
						fmt = trunc(50, 18, 0, false),
					},
					{
						"diff",
						symbols = { added = "󰐗 ", removed = "󰍶 ", modified = "󰻂 " },
						color = { bg = mocha.mantle },
						diff_color = { modified = { fg = mocha.blue } },
						fmt = trunc(0, 0, 120, true),
					},
				},

				lualine_x = {
					{
						"diagnostics",
						symbols = { error = "󰅙 ", warn = "󰀦 ", info = "󰋼 ", hint = "󰋗 " },
						color = { bg = mocha.mantle },
						separator = ":",
						fmt = trunc(0, 0, 120, true),
					},
					{
						"lsp_status",
						icon = "",
						color = { bg = mocha.mantle },
						symbols = { spinner = "", done = "", separator = ", " },
						padding = { right = 1 },
						fmt = trunc(160, 20, 80, false),
					},
				},

				lualine_y = {
					{
						"filesize",
						color = { fg = mocha.text },
						separator = { left = "" },
						fmt = trunc(0, 0, 80, true),
					},
				},

				lualine_z = {
					{ "location", separator = { left = "", right = "" } },
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {
					{
						"lsp_status",
						icon = "",
						symbols = { spinner = "", done = "", separator = ", " },
						fmt = trunc(0, 0, 80, true),
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})

		-- remove outer separator bg color
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = mocha.mantle })
	end,
}

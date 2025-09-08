return {
	{
		"nvim-mini/mini.nvim",

		version = "*",

		event = "VeryLazy",

		config = function()
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- add surrounding
					delete = "gsd", -- delete surrounding
					find = "gsf", -- find surrounding (to the right)
					find_left = "gsF", -- find surrounding (to the left)
					highlight = "gsh", -- highlight surrounding
					replace = "gsr", -- replace surrounding
					update_n_lines = "gsn", -- update `n_lines`
				},

				n_lines = 500,
			})
		end,
	},
	{
		"nvim-mini/mini.icons",

		config = function()
			require("mini.icons").mock_nvim_web_devicons()

			require("mini.icons").setup({
				file = {
					[".env"] = { glyph = "󰈡" },
					[".prettierrc"] = { glyph = "" },
					artisan = { glyph = "󰫐", hl = "MiniIconsRed" },
					["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
					["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsPurple" },
					["init.lua"] = { glyph = "" },
					LICENSE = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.md"] = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.txt"] = { glyph = "", hl = "MiniIconsOrange" },
					["composer.lock"] = { glyph = "󰘦", hl = "MiniIconsYellow" },
					["package.json"] = { glyph = "󰎙", hl = "MiniIconsGreen" },
					["package-lock.json"] = { glyph = "", hl = "MiniIconsRed" },
					README = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.md"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.txt"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsBlue" },
					["vite.config.ts"] = { glyph = "", hl = "MiniIconsPurple" },
				},

				filetype = {
					css = { glyph = "", hl = "MiniIconsPurple" },
					sh = { glyph = "", hl = "MiniIconsGreen" },
				},
			})
		end,
	},
}

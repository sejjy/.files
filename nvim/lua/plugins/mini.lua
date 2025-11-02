return {
	{
		"nvim-mini/mini.nvim",

		version = false,

		event = "VeryLazy",

		config = function()
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- Add surrounding
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`
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
					[".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
					[".env"] = { glyph = "󰈡", hl = "MiniIconsYellow" },
					[".env.example"] = { glyph = "󰈡", hl = "MiniIconsYellow" },
					[".gitattributes"] = { glyph = "󰊢", hl = "MiniIconsOrange" },
					[".gitignore"] = { glyph = "󰊢", hl = "MiniIconsOrange" },
					[".prettierignore"] = { glyph = "", hl = "MiniIconsPurple" },
					[".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
					["LICENSE"] = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.md"] = { glyph = "", hl = "MiniIconsOrange" },
					["LICENSE.txt"] = { glyph = "", hl = "MiniIconsOrange" },
					["README"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.md"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["README.txt"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
					["artisan"] = { glyph = "󰫐", hl = "MiniIconsRed" },
					["composer.lock"] = { glyph = "󰘦", hl = "MiniIconsYellow" },
					["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
					["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsPurple" },
					["init.lua"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
					["package-lock.json"] = { glyph = "󰏗", hl = "MiniIconsRed" },
					["package.json"] = { glyph = "󰎙", hl = "MiniIconsGreen" },
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

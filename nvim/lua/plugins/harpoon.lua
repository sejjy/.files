return {
	"ThePrimeagen/harpoon",

	enabled = false,

	branch = "harpoon2",

	dependencies = { "nvim-lua/plenary.nvim" },

	keys = { { "<A-a>" }, { "<A-e>" }, { "<A-h>" }, { "<A-j>" }, { "<A-k>" }, { "<A-l>" }, { "<A-p>" }, { "<A-n>" } },

	config = function()
		local toggle_opts = {
			title = " Harpoon ",
			title_pos = "center",
			ui_width_ratio = 0.5,
		}

		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<A-a>", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<A-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
		end)

		vim.keymap.set("n", "<A-h>", function()
			harpoon:list():select(1)
		end)

		vim.keymap.set("n", "<A-j>", function()
			harpoon:list():select(2)
		end)

		vim.keymap.set("n", "<A-k>", function()
			harpoon:list():select(3)
		end)

		vim.keymap.set("n", "<A-l>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<A-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<A-n>", function()
			harpoon:list():next()
		end)
	end,
}

return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	opts = {
		delay = 0,

		win = {
			no_overlap = false,
			border = "single",
		},

		layout = {
			width = { min = 20, max = 40 },
		},

		icons = {
			breadcrumb = "+",
			separator = "󰁔",
			ellipsis = "…",
			mappings = false,

			keys = {
				Up = "󰁝",
				Down = "󰁅",
				Left = "󰁍",
				Right = "󰁔",
				C = "C-",
				M = "A-",
				D = "D-",
				S = "S-",
				CR = "<Enter>",
				Esc = "<Esc>",
				ScrollWheelDown = "󱕐",
				ScrollWheelUp = "󱕑",
				NL = "<NL>",
				BS = "<BS>",
				Space = "<Leader>",
				Tab = "<Tab>",
			},
		},
	},
}

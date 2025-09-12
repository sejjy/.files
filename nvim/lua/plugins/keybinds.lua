return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	opts = {
		delay = 0,

		win = {
			no_overlap = false,
			border = "single",
		},

		icons = {
			breadcrumb = "+",
			separator = "󰁔",
			ellipsis = "",
			mappings = false,

			keys = {
				Up = "󰁝",
				Down = "󰁅",
				Left = "󰁍",
				Right = "󰁔",
				C = "Ctrl-",
				M = "Alt-",
				D = "Super-",
				S = "Shift-",
				CR = "<Enter>",
				Esc = "󱊷",
				ScrollWheelDown = "󱕐",
				ScrollWheelUp = "󱕑",
				NL = "󰌑",
				BS = "󰭜",
				Space = "<Leader>",
				Tab = "<Tab>",
			},
		},
	},
}

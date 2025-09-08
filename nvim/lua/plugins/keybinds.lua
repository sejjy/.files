return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	spec = {
		{ "<Leader>c", group = "[c]ode" },
		{ "<Leader>d", group = "[d]ocument" },
		{ "<Leader>r", group = "[r]ename" },
		{ "<Leader>s", group = "[s]earch" },
		{ "<Leader>t", group = "[t]oggle" },
		{ "<Leader>w", group = "[w]orkspace" },
		{ "<Leader>h", group = "[h]unk" },
	},

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

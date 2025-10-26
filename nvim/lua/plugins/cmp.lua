return {
	"saghen/blink.cmp",

	version = "1.*",

	dependencies = { "rafamadriz/friendly-snippets" },

	opts = {
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Class = " ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		},

		completion = {
			documentation = {
				auto_show = true,
				window = { winhighlight = "BlinkCmpDocBorder:FloatBorder" },
			},

			menu = {
				winhighlight = "BlinkCmpMenuBorder:FloatBorder,Search:None",
				draw = {
					align_to = "cursor",
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
		},

		sources = {
			providers = {
				lsp = { fallbacks = {} },
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
			},
		},

		cmdline = {
			completion = { menu = { auto_show = true } },
		},

		keymap = {
			["<A-f>"] = { "snippet_forward", "fallback" },
			["<A-b>"] = { "snippet_backward", "fallback" },
		},
	},
}

return {
	"stevearc/conform.nvim",

	keys = {
		{
			"<Leader>f",
			function()
				require("conform").format({ async = true })
			end,
			desc = "[f]ormat",
		},
	},

	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			-- css = { "prettierd" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff" },
			sh = { "shfmt" },
		},

		default_format_opts = { lsp_format = "fallback" },

		formatters = {
			shfmt = { prepend_args = { "--indent", "0" } },
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

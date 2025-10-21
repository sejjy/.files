return {
	"stevearc/conform.nvim",

	cmd = "ConformInfo",

	keys = {
		{
			"<Leader>f",
			-- Leave visual mode after range format
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end,
			mode = "",
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
			shfmt = {
				prepend_args = { "--indent", "0", "--case-indent" },
			},
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

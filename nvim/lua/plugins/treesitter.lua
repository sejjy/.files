return {
	"nvim-treesitter/nvim-treesitter",

	branch = "main",

	lazy = false,

	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		local parsers = {
			"bash",
			"c",
			"css",
			"diff",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"json",
			"lua",
			"make",
			"markdown",
			"python",
			"query",
			"regex",
			"rust",
			"tsx",
			"typescript",
			"vim",
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			once = true,
			callback = function()
				require("nvim-treesitter").install(parsers)
			end,
		})
	end,
}

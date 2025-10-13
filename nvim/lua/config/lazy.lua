local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {
	install = {
		missing = true,
		colorscheme = { "catppuccin-mocha" },
	},

	checker = {
		enabled = true,
		notify = false,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},

	ui = {
		border = "single",
		icons = {
			cmd = ":",
			config = " ",
			debug = " ",
			event = " ",
			favorite = " ",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "",
			list = { "", "", "", "" },
			loaded = "",
			not_loaded = "",
			plugin = "󰏗 ",
			runtime = " ",
			require = "󰢱 ",
			source = " ",
			start = "󰼛 ",
			task = "󰄬 ",
		},
	},
})

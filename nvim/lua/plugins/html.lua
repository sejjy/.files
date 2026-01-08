return {
	"windwp/nvim-ts-autotag",

	ft = { "html", "javascriptreact", "typescriptreact" },

	config = function()
		require("nvim-ts-autotag").setup()
	end,
}

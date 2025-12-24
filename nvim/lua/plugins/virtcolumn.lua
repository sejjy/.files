return {
	"marchyman/virt-column.nvim",

	event = "BufReadPost",

	config = function()
		local function toggle_colorcolumn()
			if vim.wo.colorcolumn == "" then
				vim.wo.colorcolumn = "80"
			else
				vim.wo.colorcolumn = ""
			end
		end

		vim.api.nvim_create_autocmd("InsertEnter", {
			callback = function()
				vim.w.saved_colorcolumn = vim.wo.colorcolumn
				vim.wo.colorcolumn = ""
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				vim.wo.colorcolumn = vim.w.saved_colorcolumn or ""
			end,
		})

		require("virt-column").setup({ char = "│" })

		vim.keymap.set("n", "<Leader>tc", toggle_colorcolumn, { desc = "toggle color [c]olumn" })
	end,
}

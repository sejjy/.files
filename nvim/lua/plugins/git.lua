return {
	"lewis6991/gitsigns.nvim",

	event = "BufReadPost",

	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function hdesc(desc)
				return { desc = "Git: " .. desc, buffer = bufnr }
			end

			local function tdesc(desc)
				return { desc = "Git: toggle " .. desc, buffer = bufnr }
			end

			-- Navigation
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, hdesc("next change"))

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, hdesc("previous change"))

			-- Actions
			vim.keymap.set("n", "<Leader>gs", gitsigns.stage_hunk, hdesc("[s]tage"))
			vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, hdesc("[r]eset"))

			vim.keymap.set("v", "<Leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[s]tage selection"))

			vim.keymap.set("v", "<Leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[r]eset selection"))

			vim.keymap.set("n", "<Leader>gS", gitsigns.stage_buffer, hdesc("[S]tage buffer"))
			vim.keymap.set("n", "<Leader>gR", gitsigns.reset_buffer, hdesc("[R]eset buffer"))
			vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, hdesc("[p]review"))
			vim.keymap.set("n", "<Leader>gi", gitsigns.preview_hunk_inline, hdesc("[i]nline preview"))

			vim.keymap.set("n", "<Leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, hdesc("[b]lame FULL"))

			vim.keymap.set("n", "<Leader>gd", gitsigns.diffthis, hdesc("[d]iff"))
			vim.keymap.set("n", "<Leader>gD", function()
				gitsigns.diffthis("~")
			end, hdesc("[D]iff against ~"))

			vim.keymap.set("n", "<Leader>gQ", function()
				gitsigns.setqflist("all")
			end, hdesc("[Q]uickfix ALL hunks"))

			vim.keymap.set("n", "<Leader>gq", gitsigns.setqflist, hdesc("[q]uickfix hunks"))

			-- Toggles
			vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame, tdesc("current line [b]lame"))
			vim.keymap.set("n", "<Leader>tl", gitsigns.toggle_deleted, tdesc("deleted [l]ines"))
			vim.keymap.set("n", "<Leader>tw", gitsigns.toggle_word_diff, tdesc("[w]ord diff"))

			-- Text object
			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "inner [h]unk", buffer = bufnr })
		end,
	},
}

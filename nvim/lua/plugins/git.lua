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

			-- navigation
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

			-- actions
			vim.keymap.set("n", "<Leader>hs", gitsigns.stage_hunk, hdesc("[s]tage"))
			vim.keymap.set("n", "<Leader>hr", gitsigns.reset_hunk, hdesc("[r]eset"))

			vim.keymap.set("v", "<Leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[s]tage selection"))

			vim.keymap.set("v", "<Leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[r]eset selection"))

			vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer, hdesc("[S]tage buffer"))
			vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer, hdesc("[R]eset buffer"))
			vim.keymap.set("n", "<Leader>hp", gitsigns.preview_hunk, hdesc("[p]review"))
			vim.keymap.set("n", "<Leader>hi", gitsigns.preview_hunk_inline, hdesc("[i]nline preview"))

			vim.keymap.set("n", "<Leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, hdesc("[b]lame FULL"))

			vim.keymap.set("n", "<Leader>hd", gitsigns.diffthis, hdesc("[d]iff"))
			vim.keymap.set("n", "<Leader>hD", function()
				gitsigns.diffthis("~")
			end, hdesc("[D]iff against ~"))

			vim.keymap.set("n", "<Leader>hQ", function()
				gitsigns.setqflist("all")
			end, hdesc("[Q]uickfix ALL hunks"))

			vim.keymap.set("n", "<Leader>hq", gitsigns.setqflist, hdesc("[q]uickfix hunks"))

			-- toggles
			vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame, tdesc("current line [b]lame"))
			vim.keymap.set("n", "<Leader>td", gitsigns.toggle_deleted, tdesc("[d]eleted lines"))
			vim.keymap.set("n", "<Leader>tw", gitsigns.toggle_word_diff, tdesc("[w]ord diff"))

			-- text object
			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "inner [h]unk", buffer = bufnr })
		end,
	},
}

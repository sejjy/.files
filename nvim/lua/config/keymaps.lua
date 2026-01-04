-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Switch buffers
vim.keymap.set("n", "<C-n>", ":bnext<Enter>")
vim.keymap.set("n", "<C-p>", ":bprevious<Enter>")

-- Switch windows
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Resize windows
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")

-- Switch tabs
vim.keymap.set("n", "<Tab>", ":tabnext<Enter>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<Enter>")

-- Move lines
vim.keymap.set("v", "<A-k>", ":m '<-2<Enter>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<Enter>gv=gv")

-- Insert lines
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- Join without moving cursor
vim.keymap.set({ "n", "v" }, "J", "mzJ`z")

-- Void register
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set({ "n", "x" }, "c", '"_c', { noremap = true })
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "[p]aste", noremap = true })
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d', { desc = "[d]elete", noremap = true })

-- Shell
vim.keymap.set("n", "<Leader>cx", ':!chmod +x "%"<Enter>', { desc = "chmod +[x]" })
vim.keymap.set("n", "<Leader>nf", ":!npm run format<Enter>", { desc = "npm run [f]ormat" })
vim.keymap.set("n", "<Leader>np", ':!npx prettier --write "%"<Enter>', { desc = "npx [p]rettier --write" })
vim.keymap.set("n", "<Leader>b", ':silent !zen-browser "%"<Enter>', { desc = "open in [b]rowser", silent = true })

-- Misc
vim.keymap.set("n", "<Esc>", ":nohlsearch<Enter>", { silent = true })
vim.keymap.set("n", "<Leader>ts", ":set spell!<Enter>", { desc = "toggle [s]pell check" })
vim.keymap.set("n", "<Leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "re[n]ame" })

-- Indent buffer without changing view
vim.keymap.set("n", "<Leader>=", function()
	local view = vim.fn.winsaveview()
	vim.cmd("normal! gg=G")
	vim.fn.winrestview(view)
end, { desc = "indent buffer" })

-- Go to next opening pair
vim.keymap.set({ "n", "x" }, ")", function()
	vim.fn.search("['\"[({<]", "W")
end)

-- Go to previous closing pair
vim.keymap.set({ "n", "x" }, "(", function()
	vim.fn.search("[]'\")}>]", "bW")
end)

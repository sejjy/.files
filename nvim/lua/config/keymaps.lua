-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- switch buffers
vim.keymap.set("n", "<C-n>", ":bnext<Enter>")
vim.keymap.set("n", "<C-p>", ":bprevious<Enter>")

-- switch windows
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- resize windows
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")

-- switch tabs
vim.keymap.set("n", "<Tab>", ":tabnext<Enter>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<Enter>")

-- move lines
vim.keymap.set("v", "<A-k>", ":m '<-2<Enter>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<Enter>gv=gv")

-- insert lines
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- join without moving cursor
vim.keymap.set({ "n", "v" }, "J", "mzJ`z")

-- void register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "[p]aste" })
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d', { desc = "[d]elete" })

-- shell
vim.keymap.set("n", "<Leader>cx", ":!chmod +x %<Enter>", { desc = "chmod +[x]" })
vim.keymap.set("n", "<Leader>nf", ":!npm run format<Enter>", { desc = "npm run [f]ormat" })

vim.keymap.set("n", "<Leader>np", function()
	vim.cmd("!npx prettier --write " .. vim.fn.expand("%"))
end, { desc = "npx [p]rettier --write" })

vim.keymap.set("n", "<Esc>", ":nohlsearch<Enter>", { silent = true })
vim.keymap.set("n", "<Leader>ts", ":set spell!<Enter>", { desc = "toggle [s]pell check" })
vim.keymap.set("n", "<Leader>rn", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "re[n]ame" })

-- indent buffer without changing view
vim.keymap.set("n", "<Leader>=", function()
	local view = vim.fn.winsaveview()
	vim.cmd("normal! gg=G")
	vim.fn.winrestview(view)
end, { desc = "indent buffer" })

-- goto next opening pair
vim.keymap.set({ "n", "x" }, ")", function()
	vim.fn.search("['\"[({<]", "W")
end)

-- goto previous closing pair
vim.keymap.set({ "n", "x" }, "(", function()
	vim.fn.search("[]'\")}>]", "bW")
end)

vim.keymap.set("n", "<Leader>z", ':!zen-browser "%"<Enter>', { desc = "open in [z]en" })

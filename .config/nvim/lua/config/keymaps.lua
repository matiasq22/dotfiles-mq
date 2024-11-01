local map = vim.keymap.set

map("v", "<leader>p", function()
	local val = vim.fn.getreg('"')
	vim.api.nvim_command([[normal! p]])
	vim.fn.setreg('"', val)
end, { desc = "Special paste, paste without replacing copy register content" })

map("n", "<C-b>", ":bd!<CR>", { desc = "Deletes the current buffer" })

-- lists navigation
map("n", "<C-j>", ":cnext<CR>zz", { desc = "Goes to the next item in the quickfixlist and center to the screen" })
map("n", "<C-k>", ":cprev<CR>zz", { desc = "Goes to the previous item in the quickfixlist and center to the screen" })
-- map("n", "<leader>i", ":lnext<CR>zz")
-- map("n", "<leader>o", ":lprev<CR>zz")
map("n", "<leader>cc", ":cclose<CR>", { desc = "Close the quick fix list" })

-- tabulation
map("v", "<", "<gv", { desc = "Indent out and keeps the selection" })
map("v", ">", ">gv", { desc = "Indent in and keeps the selection" })

-- new tab
map("n", "te", "tabedit", {noremap = true, silent = true})

-- symbols to add undo points
local symbols = { ",", ".", "!", "?", "$", ">", "<" }
for _, symbol in pairs(symbols) do
	map(
		"i",
		symbol,
		symbol .. "<c-g>u",
		{ desc = string.format("Add symbol %s to the undo list and writes it", symbol) }
	)
end

-- search result focus
map("n", "n", "nzzzv", { desc = "Goes to next result on the search and put the cursor in the middle of the screen" })
map("n", "N", "Nzzzv", { desc = "Goes to prev result on the search and put the cursor in the middle of the screen" })

-- join lines focus
map("n", "J", "mzJ`z", { desc = "Join lines and keep in the same place the cursor" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
map("t", "<C-w>l", "<C-\\><C-n><C-w>l")

-- quick env file edit
map("n", "<leader>ee", ":vsp .env<CR>", { desc = "Open .env file in a vertical split" })

map("n", "<leader>vn", vim.diagnostic.goto_next, { desc = "Goes to next diagnostic error" })
map("n", "<leader>vp", vim.diagnostic.goto_prev, { desc = "Goes to prev diagnostic error" })

map("n", "<C-s>", ":w<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-a>", "ggVG", { silent = true, desc = "select all lines in the current buffer" })

-- Remap escape
map("i", "jk", "<Esc>")

-- Buffer navigation
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

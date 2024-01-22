-- Map leader to <space>
vim.g.mapleader = " "

-- Make ctlr+c same as <Esc>
vim.keymap.set("n", "<C-c>", "<Esc>")

-- keeps cursor centered
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Can replace text without losing my paste register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- edit me
vim.keymap.set("n", "<leader>em", ":edit $MYVIMRC<CR>")

-- Send visual selection to windows clipboard
vim.keymap.set("x", "<leader>ys", ":w !CLIP.exe")

--I hate using :
vim.keymap.set("n", "<leader>ww", ":w<CR>", {desc = 'Faster Saving'})
vim.keymap.set("n", "<leader>wq", ":wq<CR>", {desc = 'Faster Saving and Quiting'})

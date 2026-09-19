vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Basic Setting --------------------------------------------------------------
-- Move Line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank in system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) --- yank in system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) --- but into system clipboard
vim.keymap.set("n", "<leader>D", [["+D]])

-- Cancel
vim.keymap.set("n", "Q", "<nop>")

--
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Dirs
vim.keymap.set("n", "<leader>cf", ":let @+ = expand('%')<CR>") -- relative path: src/filename
vim.keymap.set("n", "<leader>cF", ":let @+ = expand('%:p')<CR>") -- absolute path: /dir/src/filename
vim.keymap.set("n", "<leader>cd", ":let @+ = expand('%:p:h')<CR>") -- directory name: /dir/src
vim.keymap.set("n", "<leader>cl", function() -- file:line: src/filename:42
    local loc = vim.fn.expand("%:.") .. ":" .. vim.fn.line(".")
    vim.fn.setreg("+", loc)
    vim.notify(loc)
end)
vim.keymap.set("v", "<leader>cl", function() -- file:range: src/filename:10-20
    local s, e = vim.fn.line("v"), vim.fn.line(".")
    if s > e then s, e = e, s end
    local loc = vim.fn.expand("%:.") .. ":" .. s .. "-" .. e
    vim.fn.setreg("+", loc)
    vim.notify(loc)
    vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "n", false)
end)

-- Windows
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sq", "<C-w>q")
vim.keymap.set("n", "sr", "<C-w>r")
vim.keymap.set("n", "so", "<C-w>o")

vim.cmd [[
syntax on
filetype plugin indent on
set mouse=
]]

-- terminal
vim.opt.termguicolors = true

-- system
vim.opt.clipboard = "unnamedplus"
vim.opt.errorbells = false
vim.opt.fileencodings = "utf-i"
vim.opt.encoding = "utf-8"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
vim.opt.title = true
vim.opt.wrap = false

-- line number
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- indent
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

-- Display
vim.opt.cursorline = true
vim.opt.colorcolumn = "80,120"
vim.opt.showmatch = true

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"


vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end
})

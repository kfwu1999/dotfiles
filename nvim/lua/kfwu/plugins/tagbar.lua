return {
    "preservim/tagbar",
    config = function()
        vim.keymap.set("n", "<leader>to", ":TagbarToggle<CR>", { silent = true })
    end,
}

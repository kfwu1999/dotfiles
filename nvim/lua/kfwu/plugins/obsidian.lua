return {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "dev",
                    path = "~/Documents/Obsidian/kfwu",
                },
                {
                    name = "fin",
                    path = "~/Documents/Obsidian/financial-research-vault",
                },
                {
                    name = "zettelkasten",
                    path = "~/Documents/Obsidian/zettelkasten",
                },
            },
            ui = {
                enable = false,
                update_debounce = 200,
            },
            picker = {
                name = "telescope.nvim",
            },
            note_id_func = function(title)
                if title ~= nil then
                    return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    local suffix = ""
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                    return suffix
                end
            end,
            note_path_func = function(spec)
                local path = spec.dir / tostring(spec.id)
                return path:with_suffix(".md")
            end,
            follow_url_func = function(url)
                vim.fn.jobstart({ "open", url }) -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
            end,
        })

        vim.api.nvim_create_user_command("ObNew", "ObsidianNew", {})
        vim.api.nvim_create_user_command("ObTags", "ObsidianTags", {})
        vim.api.nvim_create_user_command("ObOpen", "ObsidianOpen", {})
        vim.api.nvim_create_user_command("ObTemplate", "ObsidianTemplate", {})
        vim.api.nvim_create_user_command("ObBacklinks", "ObsidianBacklinks", {})

        vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { silent = true })
        vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { silent = true })
        vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { silent = true })
        vim.keymap.set("n", "<leader>og", ":ObsidianTags<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { silent = true })
        vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { silent = true })
    end,
}

require("obsidian").setup({
    workspaces = {
        {
            name = "personal",
            path = "~/Documents/Obsidian/kfwu" },
    },
    ui = {
        enable = false,
        update_debounce = 200,
    },
    picker = {
        name = "telescope.nvim",
    },
    templates = {
        folder = "4-Extra/Templates",
    },
    -- Customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      if title ~= nil then
        -- Transform title into valid file name by replacing spaces with hyphens, removing invalid characters, and converting to lower case.
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, generate a random string of 4 uppercase letters.
        local suffix = ""
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        return suffix
      end
    end,

    -- Customize how note file names are generated given the ID, target directory, and title.
    ---@return string|obsidian.Path The full path to the new note.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    note_path_func = function(spec)
      -- Generate the full path using the note ID as the filename, appending the '.md' suffix.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({"open", url})  -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    -- 
    vim.api.nvim_create_user_command('ObNew', 'ObsidianNew', {}),
    vim.api.nvim_create_user_command('ObTags', 'ObsidianTags', {}),
    vim.api.nvim_create_user_command('ObOpen', 'ObsidianOpen', {}),
    vim.api.nvim_create_user_command('ObTemplate', 'ObsidianTemplate', {}),
    vim.api.nvim_create_user_command('ObBacklinks', 'ObsidianBacklinks', {}),

    -- 
    vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>og", ":ObsidianTags<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { silent = true })
})

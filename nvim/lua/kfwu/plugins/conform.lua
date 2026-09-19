return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
        { "<leader>tf", "<cmd>FormatToggle<CR>", desc = "Toggle format on save" },
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- never fall back to clangd: it would apply LLVM style too
                c = { "clang-format", lsp_format = "never" },
                cpp = { "clang-format", lsp_format = "never" },
                rust = { "rustfmt" },
                go = { "gofmt" },
            },
            formatters = {
                -- only format projects that define a style
                ["clang-format"] = {
                    cwd = require("conform.util").root_file({ ".clang-format", "_clang-format" }),
                    require_cwd = true,
                },
            },
            -- per-filetype lsp_format (above) overrides this default
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500 }
            end,
        })

        -- :FormatToggle toggles globally, :FormatToggle! for the current buffer only
        vim.api.nvim_create_user_command("FormatToggle", function(args)
            local scope = args.bang and vim.b or vim.g
            scope.disable_autoformat = not scope.disable_autoformat
            vim.notify(string.format("Format on save %s%s",
                scope.disable_autoformat and "disabled" or "enabled",
                args.bang and " (buffer)" or ""))
        end, { bang = true })
    end,
}

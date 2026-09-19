return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                rust = { "rustfmt" },
                go = { "gofmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}

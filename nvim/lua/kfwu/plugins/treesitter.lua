return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false, -- main branch does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            -- no-op for parsers already installed; needs tree-sitter-cli
            ts.install({
                "c",
                "cpp",
                "cmake",
                "make",
                "python",
                "go",
                "rust",
                "lua",
                "markdown",
                "bash",
            })

            -- start highlighting, installing the parser first if missing
            local available = ts.get_available()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if not lang then
                        return
                    end
                    if vim.treesitter.language.add(lang) then
                        vim.treesitter.start(args.buf, lang)
                    elseif vim.tbl_contains(available, lang) then
                        ts.install(lang):await(function()
                            if vim.api.nvim_buf_is_valid(args.buf) then
                                pcall(vim.treesitter.start, args.buf, lang)
                            end
                        end)
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
            })
        end,
    },
}

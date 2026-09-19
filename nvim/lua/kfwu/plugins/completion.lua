return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
    },
    opts = {
        -- default preset: <C-p>/<C-n> select, <C-y> accept, <C-space> show
        keymap = { preset = "default" },
        completion = {
            list = { selection = { preselect = true, auto_insert = false } },
            documentation = { auto_show = true },
        },
        snippets = { preset = "luasnip" },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
}

return {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
        { "<leader>S", "<cmd>GrugFar<CR>", desc = "Search and replace (rg)" },
        {
            "<leader>S",
            function()
                require("grug-far").with_visual_selection()
            end,
            mode = "v",
            desc = "Search and replace selection",
        },
    },
    opts = {},
}

vim.api.nvim_command("packadd packer.nvim")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use({
        "luisiacc/gruvbox-baby",
        as = 'gruvbox-baby',
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    -- Treesitter
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use({'nvim-treesitter/playground'})
    use({'nvim-treesitter/nvim-treesitter-context'})

    -- Harpoon
    use({'theprimeagen/harpoon'})


    -- golang
    -- use({"ray-x/go.nvim"})
    -- use({"ray-x/guihua.lua"})

    -- Undo-tree
    use({'mbbill/undotree'})

    -- Git
    use({'tpope/vim-fugitive'})
    use({'tpope/vim-rhubarb'})

    -- LSP
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
      	  -- LSP Support
      	    {'neovim/nvim-lspconfig'},
      	    {'williamboman/mason.nvim'},
      	    {'williamboman/mason-lspconfig.nvim'},

      	    -- Autocompletion
      	    {'hrsh7th/nvim-cmp'},
      	    {'hrsh7th/cmp-buffer'},
      	    {'hrsh7th/cmp-path'},
      	    {'saadparwaiz1/cmp_luasnip'},
      	    {'hrsh7th/cmp-nvim-lsp'},
      	    {'hrsh7th/cmp-nvim-lua'},

      	    -- Snippets
      	    {'L3MON4D3/LuaSnip'},
      	    {'rafamadriz/friendly-snippets'},
        }
    })

    -- Lualine
    use({
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    })

    -- Comment
    use({'numToStr/Comment.nvim'})

    -- Gitsigns
    use({
        'lewis6991/gitsigns.nvim',
        as = 'gitsigns',
        requires = {"nvim-lua/plenary.nvim"},
    })

    -- lazygit
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    -- rainbow
    -- use({"p00f/nvim-ts-rainbow"})

    -- Tagbar
    use({"preservim/tagbar"})

    -- TODO
    use({
        "folke/todo-comments.nvim",
        requires = {"nvim-lua/plenary.nvim"},
    })

    -- Start Page
    use({"mhinz/vim-startify"})

    -- Obsidian
    use({
        "epwalsh/obsidian.nvim",
        tag = "*", -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
    })

end)

return { -- https://lazy.folke.io

    -- Common deps
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },

    ----------------------------------------------------------------------------
    -- Utils
    ----------------------------------------------------------------------------
    {
        "lambdalisue/suda.vim",
        lazy =  false,
    },
    {
        "mg979/vim-visual-multi",
        event = "BufEnter",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        -- Easymotion
        "phaazon/hop.nvim",
        event = "BufEnter",
        config = {
            keys = my.easymotion_keys,
        },
    },
    {
        -- Easymotion
        "ggandor/leap.nvim",
        enabled = false,
    },
    {
        -- Tmux integration
        "christoomey/vim-tmux-navigator",
        enabled = fn.is_tmux(),
        event = "BufEnter",
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
    },
    {
        "kylechui/nvim-surround",
        lazy = false,
        -- enabled = false,
        -- config = function()
            -- NvimSurround = require("nvim-surround")
        -- end
        config = {
            keymaps = {
                insert = nil,
                insert_line = nil,
                normal = "S",
                normal_cur = "SS",
                normal_line = nil,
                normal_cur_line = nil,
                visual = "s",
                visual_line = nil,
                delete = "ds",
                change = "cs",
            },
            highlight = {
                duration = 0,
            },
        },
    },
    {
        "ahmedkhalf/project.nvim",
        name = "project_nvim",
        lazy = false,
        config = {
            detection_methods = { "pattern", "lsp" },
            manual_mode = true,
            show_hidden = true,
        },
    },
    {
        "NMAC427/guess-indent.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            _G.Comment = require("Comment.api")
        end,
    },


    ----------------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------------
    {
        -- Symbol lookup
        "stevearc/aerial.nvim",
        enabled = false,
        config = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        -- Notification system for neovim
        "rcarriga/nvim-notify",
        enabled = false,
        config = function()
            vim.notify = require("notify")
            vim.notify.setup {
                background_colour = "#000",
            }
        end,
    },
    {
        -- Adds background color to hex codes
        "norcalli/nvim-colorizer.lua",
    },
    {
        -- Dim text outside working area
        "folke/twilight.nvim",
        cmd = "Twilight",
        enabled = false,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        enabled = false,
        config = {
            pack = { gitsigns = { enabled = true }}
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        config = true,
    },


    ----------------------------------------------------------------------------
    -- Git
    ----------------------------------------------------------------------------
    {
        -- View additions, deletions, changes
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = true,
    },
    {
        -- Diff UI
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
    },
    {
        -- Get URLs for specific lines of code
        "ruifm/gitlinker.nvim",
        keys = { "<leader>gy" },
        config = true,
    },
    {
        -- git interface
        "TimUntersberger/neogit",
        cmd = "Neogit",
        enabled = false,
    },


    ----------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------
    {
        "LnL7/vim-nix",
        ft = "nix",
    },
    {
        "alaviss/nim.nvim",
        ft = "nim",
    },
    {
        "prisma/vim-prisma",
        ft = "prisma",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        enabled = false,
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                config = true,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "ray-x/lsp_signature.nvim" },
        config = function()
            require("core.lsp")
        end,
    },
    {
        -- Panel for LSP errors/warnings
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        config = {
            action_keys = {
                previous = "i",
                next = "k",
            },
        },
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional
        },
        opts = {
            -- configurations go here
        },
    },


    ----------------------------------------------------------------------------
    -- Themes
    ----------------------------------------------------------------------------
    { "rebelot/kanagawa.nvim" },
    { "navarasu/onedark.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "NTBBloodbath/doom-one.nvim" },
    {
        "sainnhe/gruvbox-material",
        init = function()
            -- material, mix, original (washed out -> vivid)
            vim.g.gruvbox_material_palette = "mix"
            vim.g.gruvbox_material_better_performance = 1
        end
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = {
            filter = "octagon",
            background_clear = {
                "telescope",
            },
        },
    },
}

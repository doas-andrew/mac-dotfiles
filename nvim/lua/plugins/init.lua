local function pack_use()
    -- https://github.com/wbthomason/packer.nvim#specifying-plugins
    local use = require("packer").use
    use { "wbthomason/packer.nvim" }


    ----------------------------------------------------------------------
    -- Telescope
    ----------------------------------------------------------------------

    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        requires = {
            { "nvim-lua/plenary.nvim"                      },
            { "nvim-telescope/telescope-file-browser.nvim" },
            {
                "natecraddock/telescope-zf-native.nvim",
                run = "make",
            },
            {
                "nvim-telescope/telescope-media-files.nvim",
                requires = "nvim-lua/popup.nvim",
            },
        },
        config = function()
            require("plugins.telescope").config()
        end,
    }


    ----------------------------------------------------------------------
    -- Utils
    ----------------------------------------------------------------------

    use {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup({
                keys = vim.g.code_easymotion_keys,
            })
        end,
    }

    use {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
    }

    use {
        "winston0410/commented.nvim",
        config = function()
            require("plugins.commented").config()
        end,
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "pattern", "lsp" },
                manual_mode = true,
                show_hidden = true,
            })
        end,
    }

    -- slow :(
    -- use {
        -- "kyazdani42/nvim-tree.lua",
        -- requires = "kyazdani42/nvim-web-devicons",
        -- config = function()
            -- require("plugins.nvim-tree").config()
        -- end,
    -- }

    use {
        "folke/which-key.nvim",
        disable = true,
        event = "BufWinEnter",
        config = function()
            require("plugins.which-key").config()
        end,
    }


    ----------------------------------------------------------------------
    -- Git
    ----------------------------------------------------------------------

    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.git").gitsigns()
        end,
    }

    use {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("plugins.git").neogit()
        end,
    }

    use {
        "sindrets/diffview.nvim",
        opt = true,
        after = "neogit",
        cmd = "DiffviewOpen",
        config = function()
            require("plugins.git").diffview()
        end,
    }

    use {
        "ruifm/gitlinker.nvim",
        opt = true,
        requires = "nvim-lua/plenary.nvim",
        keys = { "<leader>gy" },
        config = function()
            require("plugins.git").gitlinker()
        end,
    }


    ----------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------

    use "ellisonleao/gruvbox.nvim"
    use "rmehri01/onenord.nvim"

    use {
        "mhinz/vim-startify",
        config = function()
            require("plugins.startify").config()
        end,
    }

    use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.barbar")
        end,
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.lualine")
        end,
    }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
        end,
    }

    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({ plugins = { gitsigns = { enabled = true } } })
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        -- disable = true,
        config = function()
            require("plugins.indent-guides").config()
        end,
    }

    use {
        -- Adds background color to hex codes
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }


    ----------------------------------------------------------------------
    -- General plugins
    ----------------------------------------------------------------------

    use "tpope/vim-surround"

    use {
        -- Live HTML editting
        "turbio/bracey.vim",
        opt = true,
        ft = "html",
        run = "npm install --prefix server",
    }

    -- use {
        -- "iamcco/markdown-preview.nvim",
        -- opt = true,
        -- ft = "markdown",
        -- run = function()
            -- vim.fn["mkdp#util#install"]()
        -- end,
    -- }


    -----------------------------------------------------------------------------
    -- LSP
    -----------------------------------------------------------------------------

    use "LnL7/vim-nix"
    use "ray-x/lsp_signature.nvim"
    use "neovim/nvim-lspconfig"

    use {
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = function()
            require "plugins.lsp"
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        config = function()
            require("plugins.treesitter").config()
        end,
    }


    -----------------------------------------------------------------------------
    -- Completion and snippets
    -----------------------------------------------------------------------------

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp"     },
            { "hrsh7th/cmp-path"         },
            { "hrsh7th/cmp-buffer"       },
            { "hrsh7th/cmp-nvim-lua"     },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            require("plugins.completion")
        end,
    }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip").config.set_config({
                history = true,
            })
        end,
    }
end


----------------------------------------------------------------------
-- Execute
----------------------------------------------------------------------
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

local function load_plugins()
    local pack = require("packer")
    pack.init {
        compile_path = install_path .. "/plugin/packer_compiled.lua",
        git = { clone_timeout = 1000 },
    }
    pack.startup {
        function()
            pack_use()
        end,
    }
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    load_plugins()
    require("packer").sync()
else
    load_plugins()
end

local pack_use = function()
    local use = require("packer").use
    use { "wbthomason/packer.nvim" }

    ----------------------------------------------------------------------
    -- Dependencies
    ----------------------------------------------------------------------
    use { "nvim-lua/plenary.nvim",        module = "plenary"           }
    use { "nvim-lua/popup.nvim",          module = "popup"             }
    use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }

    ----------------------------------------------------------------------
    -- Telescope
    ----------------------------------------------------------------------
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        opt = true,
        run = "make",
    }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.telescope").config()
        end,
    }

    ----------------------------------------------------------------------
    -- Utils
    ----------------------------------------------------------------------
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "nvim-web-devicons",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        config = function()
            require("plugins.nvim-tree").config()
        end,
    }
    use { "christoomey/vim-tmux-navigator" }
    use { "easymotion/vim-easymotion" }
    -- use { "ctrlpvim/ctrlp.vim" }
    use {
        "winston0410/commented.nvim",
        config = function() require("plugins.commented").config() end,
    }
    --use {
    --    "terrortylor/nvim-comment"
    --}
    use {
        "chrisbra/SudoEdit.vim"
    }

    ----------------------------------------------------------------------
    -- Git
    ----------------------------------------------------------------------
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = "plenary.nvim",
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
        requires = "plenary.nvim",
        keys = { "<leader>gy" },
        config = function()
            require("plugins.git").gitlinker()
        end,
    }

    ----------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------
    use { "morhetz/gruvbox" }
    use { "sainnhe/everforest" }
    use {
        "famiu/feline.nvim",
        config = function()
            require("plugins.feline").config()
        end,
    }
    use {
        "mhinz/vim-startify",
        event = "VimEnter",
        config = function()
            require("plugins.startify").config()
        end,
    }
    use {
        -- This package really slows down vim for some reason
        "lukas-reineke/indent-blankline.nvim",
        cond = function()
            return as._default(vim.g.code_indent_guides)
        end,
        config = function()
            require("plugins.indent-guides").config()
        end,
    }
    use {
        "akinsho/bufferline.nvim",
        requires = "nvim-web-devicons",
        cond = function()
            return false
        end,
        config = function()
            require("plugins.bufferline").config()
        end,
    }

    ----------------------------------------------------------------------
    -- General plugins
    ----------------------------------------------------------------------
    use {
        "turbio/bracey.vim",
        opt = true,
        ft = "html",
        run = "npm install --prefix server",
    }
    use {
        "iamcco/markdown-preview.nvim",
        opt = true,
        ft = "markdown",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }
end

----------------------------------------------------------------------
-- End
----------------------------------------------------------------------
local fn, execute = vim.fn, vim.api.nvim_command
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

local function load_plugins()
    local pack = require "packer"
    pack.init {
        compile_path = install_path .. "/plugin/packer_compiled.lua",
        git = { clone_timeout = 600 },
    }
    pack.startup {
        function()
            pack_use()
        end,
    }
end

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    load_plugins()
    require("packer").sync()
else
    load_plugins()
end

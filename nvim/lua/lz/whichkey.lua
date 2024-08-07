return {
    "folke/which-key.nvim",
    lazy = false,
    enabled = false,
    config = function()
        local wk = require("which-key")

        wk.setup {
            operators = {
                gc = "Comments",
                gb = "Comments",
                ys = "Surround",
            },
            key_labels = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
        }

        local mappings = {
            ["<leader>"] = {
                ["f"] = { name = "Find" },
                ["b"] = { name = "Buffer" },
                ["g"] = { name = "Git" },
                ["l"] = { name = "LSP" },
            },
        }
        wk.register(mappings, { mode = "n" })
        wk.register(mappings, { mode = "v" })
    end,
}

local banner = require("core.banners")[my.st_header]

return {
    "nvimdev/dashboard-nvim",
    name = "dashboard",
    event = "VimEnter",
    enabled = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = {
        theme = "hyper",
        shortcut_type = "letter", -- letter or number
        config = {
            disable_move = true,
            header = banner,
            footer = {},
            --  shortcut = {
                --  { desc = "foo", group = "1", key = "dot", action = "echo 1" },
            --  },
            center = {
                {
                    desc = "Alacritty",
                    key = "al",
                    action = ":edit ~/dotfiles/alacritty/alacritty.yml",
                },
            },
        },
    },
}

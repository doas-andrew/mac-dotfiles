return {
    -- Status line
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = {
        options = {
            icons_enabled = true,
            theme = "auto",
            --  theme = 'monokai-pro', -- default is "auto"
            --  section_separators = { left = "", right = ""},
            --  component_separators = { left = "", right = ""},
            section_separators = { left = "", right = "" },
            component_separators = "",
            disabled_filetypes = {},
            always_divide_middle = false,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },

            lualine_x = {
                "encoding",
                --  "fileformat",
                --  "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
    },
}

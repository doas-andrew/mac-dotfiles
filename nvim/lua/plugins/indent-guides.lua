local M = {}

M.config = function()
    require("indent_blankline").setup({
        char = "",

        -- Colorize the current context's guide
        show_current_context = true,
        -- Underline the current context's opening line of code
        show_current_context_start = false,

        filetype_exclude = {
            "help",
            "vimwiki",
            "startify",
            "man",
            "git",
            "packer",
            "gitmessengerpopup",
            "diagnosticpopup",
            "markdown",
            "lspinfo",
        },
    })
end

return M

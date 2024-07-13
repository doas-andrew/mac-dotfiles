-- https://neovim.io/doc/user/autocmd.html#events

--  local api, fn = vim.api, vim.fn

if my.highlight_yank then
    fn.augroup("TextYankHighlight", {
        {
            event = "TextYankPost",
            pattern = "*",
            desc = "highlight text on yank",
            command = function()
                vim.highlight.on_yank { timeout = 200 }
            end,
        },
    })
end

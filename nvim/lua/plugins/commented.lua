local M = {}

M.config = function()
    require("commented").setup({
        opts = {
            comment_padding = nil
        }
    })
end

return M

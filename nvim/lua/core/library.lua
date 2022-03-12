-- Store all functions in one global table so they are able to survive re-requiring this file
DATA_PATH = vim.fn.stdpath("data")

_G.as = {
    _store = _AsGlobalCallbacks or {},
}

-- Create global variables from config file
_G.my = require("core.config")

-- mappings
function as.map(mode, key, action, opts)
    local isRecursive = vim.startswith(action, "<Plug>")
    opts = vim.tbl_extend("keep", opts or {}, { noremap = not isRecursive, silent = true, expr = false })
    vim.api.nvim_set_keymap(mode, key, action, opts)
end


function arr_join(arr, join)
    join = join or string.char(10)
    tmp = ""
    for idx, ele in pairs(arr) do
        tmp = tmp .. (idx ~= 1 and join .. ele or ele)
    end
    return tmp
end

-- autocommands
-- function as.nvim_set_au(au_type, where, dispatch)
    -- vim.cmd(string.format("au! %s %s %s", au_type, where, dispatch))
-- end

-- function as.check_and_set(option, au_type, where, dispatch, boolean)
    -- if as._default(option, boolean) == true then
        -- as.nvim_set_au(au_type, where, dispatch)
    -- end
-- end

-- inspect
function as.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
    return ...
end

-- default option
function as._default(option, bool)
    if option ~= nil then
        return option
    else
        return bool or false
    end
end

-- function as._lsp_auto(server)
    -- local blacklist = vim.g.code_lsp_autostart_blacklist
    -- if blacklist == nil or #blacklist < 1 then
        -- return true
    -- end
    -- for _, v in pairs(blacklist) do
        -- if server == v then
            -- return false
        -- end
    -- end
    -- return true
-- end

-- function as._has_value(table, value)
    -- for _, v in pairs(table) do
        -- if value == v then
            -- return v
        -- end
    -- end
-- end

-- function as._compe(source, component)
    -- local blacklist = vim.g.code_compe_sources_blacklist
    -- if blacklist ~= nil then
        -- for _, v in pairs(blacklist) do
            -- if source == v then
                -- return false
            -- end
        -- end
    -- end
    -- return component
-- end

-- function as.select_theme(theme)
    -- local all_colors = vim.fn.getcompletion("", "color")
    -- local default = "gruvbox"
    -- local fmt = string.format
    -- for _, v in pairs(all_colors) do
        -- if theme == v then
            -- return theme
        -- end
    -- end
    -- for _, v in pairs(all_colors) do
        -- if default == v then
            -- print(fmt([[colorscheme "%s" doesn't exist, using default]], theme))
            -- return default
        -- end
    -- end
    -- return "default"
-- end

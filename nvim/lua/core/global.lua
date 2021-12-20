--- store all callbacks in one global table so they are able to survive re-requiring this file
DATA_PATH = vim.fn.stdpath "data"

_G.as = {
    _store = _AsGlobalCallbacks or {},
}

-- create global variables for config file
local ok, config = pcall(require, "core.config")
if ok then
    for opt, val in pairs(config) do
        vim.g["code_" .. opt] = val
    end
end

-- mappings
function as.map(mode, key, action, opts)
    local isRecursive = vim.startswith(action, "<Plug>")
    opts = vim.tbl_extend("keep", opts or {}, { noremap = not isRecursive, silent = true, expr = false })
    vim.api.nvim_set_keymap(mode, key, action, opts)
end

-- autocommands
function as.nvim_set_au(au_type, where, dispatch)
    vim.cmd(string.format("au! %s %s %s", au_type, where, dispatch))
end

function as.check_and_set(option, au_type, where, dispatch, boolean)
    if as._default(option, boolean) == true then
        as.nvim_set_au(au_type, where, dispatch)
    end
end

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

function as._default_num(option, int)
    if option ~= nil and tonumber(option) then
       return option
    else
       return int or 0
    end
end

function as._lsp_auto(server)
    local blacklist = vim.g.code_lsp_autostart_blacklist
    if blacklist == nil or #blacklist < 1 then
        return true
    end
    for _, v in pairs(blacklist) do
        if server == v then
            return false
        end
    end
    return true
end

function as._lsp_borders(value)
    local opt = { "single", "double" }
    if value ~= nil then
        for _, v in pairs(opt) do
            if value == v then
                return v
            end
        end
    end
    return nil
end

function as._compe(source, component)
    local blacklist = vim.g.code_compe_sources_blacklist
    if blacklist ~= nil then
        for _, v in pairs(blacklist) do
            if source == v then
                return false
            end
        end
    end
    return component
end

function as.select_theme(theme)
    local all_colors = vim.fn.getcompletion("", "color")
    local default = "neon"
    local fmt = string.format
    for _, v in pairs(all_colors) do
        if theme == v then
            return theme
        end
    end
    for _, v in pairs(all_colors) do
        if default == v then
            print(fmt([[colorscheme "%s" doesn't exist, using default]], theme))
            return default
        end
    end
    return "default"
end

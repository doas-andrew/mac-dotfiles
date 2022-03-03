_G.fn = {}

function fn.reload(x)
    require("plenary.reload").reload_module(x)
    return require(x)
end

function fn.inspect(...)
    print(vim.inspect(...))
end

function fn.dump(...)
    local arg = ...
    local t = type(arg)
    local text = ""

    if t == "table" then
        for key, val in pairs(arg) do
            text = text..key.." = "..tostring(val).."\n"
        end

        if #text == 0 then
            text = "Empty"
        end
    elseif t == "nil" then
        text = "NIL"
    else
        text = tostring(arg)
    end

    vim.notify(text, "info", {
        timeout = 300 * 1000
    })
end

function closeBufferOrWindow()
    -- Closes current buffer, and then closes window if
    -- there are no more buffers. Useful for git commit.
    vim.cmd("bdel")
    if vim.fn.bufname("%") == "" then
        vim.cmd("q")
    end
end

--  function as.arr_join(arr, join)
    --  join = join or string.char(10)
    --  local tmp = ""
    --  for idx, ele in pairs(arr) do
        --  tmp = tmp .. (idx ~= 1 and join .. ele or ele)
    --  end
    --  return tmp
--  end

-- function as.check_and_set(option, au_type, where, dispatch, boolean)
    -- if as._default(option, boolean) == true then
        -- as.nvim_set_au(au_type, where, dispatch)
    -- end
-- end

-- default option
--  function as._default(option, bool)
    --  if option ~= nil then
        --  return option
    --  else
        --  return bool or false
    --  end
--  end

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

-- function as._has_value(tbl, value)
    -- for _, v in pairs(tbl) do
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

--  function as.select_theme(theme)
    --  local all_colors = vim.fn.getcompletion("", "color")
    --  local default = "gruvbox-material"

    --  for _, v in pairs(all_colors) do
        --  if theme == v then
            --  return theme
        --  end
    --  end

    --  for _, v in pairs(all_colors) do
        --  if default == v then
            --  print(string.format([[colorscheme "%s" doesn't exist, using default]], theme))
            --  return default
        --  end
    --  end

    --  return default
--  end

----------------------------------------------------------------------------------------------------
-- Mappings
----------------------------------------------------------------------------------------------------

function fn.map(mode, key, cmd, opts)
    if type(opts) == "string" then
        opts = { desc = opts }
    else
        opts = opts or {}
    end
    vim.keymap.set(mode, key, cmd, vim.tbl_extend("keep", opts, {
        remap = false, silent = true, expr = false
    }))
end

function fn.make_map(mode, default_opts)
    -- Make a copy, vim.tbl_extend mutates its args
    --  local parent_opts = vim.deepcopy(opts)
    return function(key, action, opts)
        if type(opts) == "string" then
            opts = { desc = opts }
        else
            opts = opts or {}
        end
        vim.keymap.set(mode, key, action, vim.tbl_extend("keep", opts, default_opts))
    end
end


----------------------------------------------------------------------------------------------------
-- Autocommand
----------------------------------------------------------------------------------------------------
-- @class Autocommand
-- @field description string
-- @field event  string[] list of autocommand events
-- @field pattern string[] list of autocommand patterns
-- @field command string | function
-- @field nested  boolean
-- @field once    boolean
-- @field buffer  number

-- Create an autocommand
-- returns the group ID so that it can be cleared or manipulated.
-- @param name string
-- @param commands Autocommand[]
-- @return number
function fn.augroup(name, commands, clear)
    local id = vim.api.nvim_create_augroup(name, { clear = clear or true })
    for _, autocmd in ipairs(commands) do
        local is_callback = type(autocmd.command) == "function"
        vim.api.nvim_create_autocmd(autocmd.event, {
            group = name,
            pattern = autocmd.pattern,
            desc = autocmd.desc,
            callback = is_callback and autocmd.command or nil,
            command = not is_callback and autocmd.command or nil,
            once = autocmd.once,
            nested = autocmd.nested,
            buffer = autocmd.buffer,
        })
    end
    return id
end

function fn.autocmd(arr)
    local script = ""
    for _, cmd in ipairs(arr) do
        script = script .. string.format(
            "\nautocmd %s %s %s", cmd[1], cmd[2], cmd[3])
    end
    vim.cmd(script)
end

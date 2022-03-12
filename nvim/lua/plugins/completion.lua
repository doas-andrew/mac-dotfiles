local cmp = require("cmp")
local lsp_expand = require("luasnip").lsp_expand

local lsp_sources = {
    nvim_lsp = "[LSP]",
    path     = "[F]",
    luasnip  = "[S]",
    buffer   = "[B]",
    nvim_lua = "[Lua]",
}

local lsp_symbols = {
    Class = "   Class",
    Color = "   Color",
    Constant = "   Constant",
    Constructor = "   Constructor",
    Enum = " ❐  Enum",
    EnumMember = "   EnumMember",
    Event = "   Event",
    Field = " ﴲ  Field",
    File = "   File",
    Folder = "   Folder",
    Function = "   Function",
    Interface = " ﰮ  Interface",
    Keyword = "   Keyword",
    Method = "   Method",
    Module = "   Module",
    Operator = "   Operator",
    Property = "   Property",
    Reference = "   Reference",
    Snippet = " ﬌  Snippet",
    Struct = " ﳤ  Struct",
    Text = "   Text",
    TypeParameter = "   TypeParameter",
    Unit = "   Unit",
    Value = "   Value",
    Variable = "[] Variable",
}


cmp.setup({
    snippet = {
        expand = function(args)
            lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<M-i>"]  = cmp.mapping.select_prev_item(),
        ["<M-k>"]  = cmp.mapping.select_next_item(),
        ["<C-b>i"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"]  = cmp.mapping.scroll_docs(4),
        ["<ESC>"]  = cmp.mapping.abort(),
        -- ["<Tab>"]  = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = lsp_sources[entry.source.name]
            return item
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip"  },
        { name = "path"     },
        { name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
    }),
})

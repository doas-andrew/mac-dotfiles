local lsp_sources = {
    nvim_lsp = "[LSP]",
    path     = "[F]",
    luasnip  = "[S]",
    buffer   = "[B]",
    nvim_lua = "[Lua]",
}

local lsp_symbols = {
    Class         = "   Class",
    Color         = "   Color",
    Constant      = "   Constant",
    Constructor   = "   Constructor",
    Enum          = " ❐  Enum",
    EnumMember    = "   EnumMember",
    Event         = "   Event",
    Field         = " ﴲ  Field",
    File          = "   File",
    Folder        = "   Folder",
    Function      = "   Function",
    Interface     = " ﰮ  Interface",
    Keyword       = "   Keyword",
    Method        = "   Method",
    Module        = "   Module",
    Operator      = "   Operator",
    Property      = "   Property",
    Reference     = "   Reference",
    Snippet       = "    Snippet",
    Struct        = " ﳤ  Struct",
    Text          = "   Text",
    TypeParameter = "   TypeParameter",
    Unit          = "   Unit",
    Value         = "   Value",
    Variable      = "[] Variable",
}

local ctrl_i = vim.g.neovide and "<C-i>" or "<C-b>i"

return {
    "hrsh7th/nvim-cmp",
    keys = { ":" },
    event = "InsertEnter",
    dependencies = {
        { "L3MON4D3/LuaSnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-cmdline" },
        { "lukas-reineke/cmp-rg" },
        { "saadparwaiz1/cmp_luasnip" },
        { "petertriho/cmp-git", config = true },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ["<M-i>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ["<M-k>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },

                ["<Up>"]   = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },

                [ctrl_i]  = cmp.mapping.scroll_docs(-4),
                ["<C-k>"] = cmp.mapping.scroll_docs(4),

                ["<Esc>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),

                --  ["<Tab>"] = cmp.mapping.confirm {
                    --  --  behavior = cmp.ConfirmBehavior.Insert,
                    --  --  select = false,
                    --  behavior = cmp.ConfirmBehavior.Replace,
                    --  select = true,
                --  },

                --  ["<CR>"] = cmp.mapping.confirm {
                    --  --  behavior = cmp.ConfirmBehavior.Insert,
                    --  --  select = false,
                    --  behavior = cmp.ConfirmBehavior.Replace,
                    --  select = true,
                --  },

                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        cmp.confirm()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        print(luasnip.jumpable(-1))
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            formatting = {
                format = function(entry, item)
                    item.kind = lsp_symbols[item.kind]
                    --  item.menu = lsp_sources[entry.source.name]
                    return item
                end,
            },
            sources = cmp.config.sources {
                {
                    name = "nvim_lsp",
                    priority = 20,
                    max_item_count = 15,
                },
                {
                    name = "luasnip",
                    priority = 15,
                },
                {
                    name = "rg",
                    option = {
                        additional_arguments = "--hidden --smart-case",
                        context_before = 5,
                        context_after = 5,
                    },
                    keyword_length = 3,
                    max_item_count = 5,
                    priority = 2,
                },
                {
                    name = "buffer",
                    keyword_length = 3,
                    max_item_count = 5,
                    priority = -2,
                    option = {
                        get_bufnrs = function() return vim.api.nvim_list_bufs() end,
                    },
                },
                { name = "path" },
                { name = "nvim_lua" },
            },
            experimental = {
                ghost_text = true,
            },
        }

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
    end,
}

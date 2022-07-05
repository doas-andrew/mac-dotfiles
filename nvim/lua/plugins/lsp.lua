if not vim.g.code_lsp_enabled then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
    capabilities = capabilities,
    flags = {
        debounce_text_changes = vim.g.code_lsp_debounce
    },
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            max_width = 90, fix_pos = true, hint_prefix = " "
        })

        if client and client.server_capabilities.codeLensProvider then
            as.augroup("RefreshCodeLens", {
                {
                    event = { "BufEnter", "CursorHold", "InsertLeave" },
                    buffer = bufnr,
                    command = function()
                        vim.lsp.codelens.refresh()
                    end,
                },
            })
        end

        -- as.map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
        -- as.map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
        -- as.map("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>")
        -- as.map("n", "gr", ":Telescope lsp_references<CR>")
        -- as.map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
        -- as.map("n", "K", ":lua vim.lsp.buf.signature_help()<CR>")
        -- as.map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
        -- as.map("n", "<leader>lgD", ":lua vim.lsp.buf.declaration()<CR>")
        -- as.map("n", "<leader>lgd", ":lua vim.lsp.buf.definition()<CR>")
        -- as.map("n", "<leader>lgy", ":lua vim.lsp.buf.type_definition()<CR>")
        -- as.map("n", "<leader>lgr", ":Telescope lsp_references<CR>")
        -- as.map("n", "<leader>lgi", ":lua vim.lsp.buf.implementation()<CR>")
        -- as.map("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>")
        -- as.map("n", "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>")
        -- as.map("n", "<leader>la", ":Telescope lsp_code_actions<CR>")
        -- as.map("n", "<leader>lc", ":lua vim.diagnostic.hide()<CR>")
        -- as.map("n", "<leader>lA", ":Telescope lsp_range_code_actions<CR>")
        -- as.map("n", "<leader>ld", ":Telescope diagnostics bufnr=0<CR>")
        -- as.map("n", "<leader>lD", ":Telescope diagnostics<CR>")
        -- as.map("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>")
        -- as.map("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>")
        -- as.map("n", "<leader>lS", ":Telescope lsp_workspace_symbols<CR>")
        -- as.map("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>")
        -- as.map("n", "<leader>lp", ":lua require('lsp').PeekDefinition()<CR>")
        -- as.map("n", "<leader>ll", ":lua vim.diagnostic.open_float(0, {border = as._lsp_borders(vim.g.code_lsp_window_borders)})<CR>")
        -- as.map("n", "<c-p>", ":lua vim.diagnostic.goto_prev({float = {border = as._lsp_borders(vim.g.code_lsp_window_borders)}})<CR>")
        -- as.map("n", "<c-n>", ":lua vim.diagnostic.goto_next({float = {border = as._lsp_borders(vim.g.code_lsp_window_borders)}})<CR>")
        -- as.map("n", "<leader>l,s", [[:LspStop <C-R>=<CR>]], { silent = false })
    end,
}

local settings = {
    sumneko_lua = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                    "as",
                },
            },
            workspace = {
                maxPreload = 10000,
                preloadFileSize = 50000,
            },
        },
    },
}

local installer = require("nvim-lsp-installer")
installer.setup()

for _, lsp in pairs(installer.get_installed_servers()) do
    opts.settings = settings[lsp.name]
    require("lspconfig")[lsp.name].setup(opts)
end

-- file not being used
-- holding onto it for mappings
return



require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = {
        -- enable snippet support

        -- capabilities = require("lsp").capabilities,
        -- map buffer local keybindings when the language server attaches

        on_attach = common_on_attach,
        flags = { debounce_text_changes = vim.g.code_lsp_debounce },
        autostart = as._lsp_auto(server.name),
    }

    -- language specific config
    if server.name == "bashls" then
        opts.filetypes = { "sh", "zsh" }
    end

    if server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {
                        "vim",
                        "as",
                        "DATA_PATH",
                        "use",
                        "run",
                    },
                },
                workspace = {
                    maxPreload = 10000,
                    preloadFileSize = 50000,
                },
            },
        }
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

local lspconfig = require("lspconfig")
local mason_ok, masonlsp = pcall(require, "mason-lspconfig")
local cmplsp = require("cmp_nvim_lsp")
local lspsig = require("lsp_signature")

local underline_level = vim.diagnostic.severity[
    string.upper(my.lsp_underline_level or "HINT")
]

local function lspRightAlign(diag)
	local line = diag.lnum
    line = vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1] or ""
	local total_width = vim.api.nvim_get_option("columns")
    -- Calculate the space needed to right align
    local num = total_width - #(line) - #(diag.message) - 12
	return string.rep(" ", num) .. diag.message
end

vim.diagnostic.config {
	virtual_text = my.virtual_text_enabled and {
        source = true,
        prefix = "",
        format = lspRightAlign,
        spacing = 0,
    },
    signs = true,
    underline = {
        severity = { min = underline_level },
    },
    float = {
        --  source = 'always',
        focusable = true,
        focus = false,
        border = 'single',
        --  format = function(diag)
            --  -- Customize how diagnostic message will be shown: show error code.
            --  -- See null-ls.nvim#632, neovim#17222 for how to pick up `code`
            --  local user_data
            --  user_data = diag.user_data or {}
            --  user_data = user_data.lsp or user_data.null_ls or user_data
            --  local code = (
                --  -- TODO: symbol is specific to pylint (will be removed)
                --  diag.symbol or diag.code or
                --  user_data.symbol or user_data.code
            --  )

            --  if code then
                --  return string.format("%s (%s)", diag.message, code)
            --  else
                --  return diag.message
            --  end
        --  end,
    },
}

fn.autocmd {
    --  { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
    { "CursorHold", "*", "lua vim.diagnostic.open_float(0, { scope = 'cursor' })" },
    --  { "CursorHoldI", "*", "silent! lua vim.lsp.buf.signature_help()" },
}

local opts = {
    capabilities = cmplsp.default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    flags = {
        debounce_text_changes = my.lsp_debounce
    },
    on_attach = function(client, bufnr)
        lspsig.on_attach {
            max_width = 90, fix_pos = true, hint_prefix = " "
        }
    end,
}

local settings = {}

local function my_server_setup(server_name)
    opts.settings = settings[server_name]
    lspconfig[server_name].setup(opts)
end

if mason_ok then
    masonlsp.setup_handlers { my_server_setup }
else
    for _, s in ipairs(my.servers) do
        my_server_setup(s)
    end
end

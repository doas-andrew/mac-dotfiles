_G.my = {
    ----------------------------------------------------------------------------
    --- Theming
    ----------------------------------------------------------------------------

    -- Set theme; Not compatible with all color schemes
    -- @value: string: light, dark
    color_theme = "dark",

    -- Set theme; Not compatible with all color schemes
    -- @value: string: gruvbox-material, edge, sonokai, monokai-pro

    --  color_scheme = "monokai-pro",
    color_scheme = "gruvbox-material",
    --  color_scheme = "sonokai",

    ----------------------------------------------------------------------------
    --- General
    ----------------------------------------------------------------------------

    -- Use these keys for easymotion hints
    -- @value: string
    -- @default: etovxqpdygfblzhckisuran
    easymotion_keys = "asdf;lkjqwerpoiu",

    -- Enable mouse in Neovim
    -- @value: boolean
    enable_mouse = true,

    -- Milliseconds to wait for a mapped sequence to complete.
    -- @value: integer
    timeoutlen = 400,

    -- Turn this off for "big" files
    -- @value: boolean
    use_swapfile = false,

    -- Debounce swapfile writes for this many milliseconds
    -- @value: integer
    updatetime = 350,

    -- Keep the cursor as a block in insert mode.
    -- @value: boolean
    cursor_block = false,

    -- Cache undo history and restore it to buffer on file load
    -- @value: boolean
    remember_undo_history = false,

    -- Number of screen lines to use for the command-line.
    -- Zero = hide when not in use
    -- @value: integer
    cmd_height = 0,

    -- Minimal number of screen lines to keep above and below the cursor.
    -- @value: integer
    scroll_off = 5,

    -- When on, lines longer than the width of the window will wrap and
    -- displaying continues on the next line.
    -- @value: boolean
    word_wrap = true,

    -- Enable code folding
    -- @value: boolean
    enable_folding = false,

    -- Hightlight text when yanked.
    -- Can be toggled.
    -- @value: boolean
    highlight_search = true,

    -- Hightlight text when yanked.
    -- @value: boolean
    highlight_yank = true,

    -- UNUSED
    -- Basic trim of trailing whitespace.
    -- @value: boolean
    trim_trailing_space = true,

    -- UNUSED
    -- Keep the last cursor position when reopening a buffer.
    -- @value: boolean
    preserve_cursor = true,

    -- UNUSED
    -- Format on save.
    -- @value: boolean
    format_on_save = true,

    -- UNUSED
    -- File explorer side.
    -- @value: string: left, right
    explorer_side = "left",

    ----------------------------------------------------------------------------
    -- Line and column display
    ----------------------------------------------------------------------------

    -- Absolute: Show line numbers.
    -- Relative: Show line numbers incrementing away from cursor's line.
    -- Hybrid: Show absolute line number for the cursor's line, otherwise relative.
    -- Off: Disable line numbers.
    -- @value: string: absolute, relative, hybrid, off
    line_numbers = "absolute",

    -- Highlight the line number that the cursor occupies..
    -- @value: boolean
    highlight_cursor_line_number = true,

    -- Highlight the line that the cursor occupies.
    -- @value: boolean
    highlight_cursor_line = false,

    -- Highlight the column that the cursor occupies.
    -- @value: boolean
    highlight_cursor_column = false,

    -- Column number for right margin. Useful for aligning text.
    -- @value: integer
    color_column = 81,

    -- Show colorcolumn by default. (Can be toggled)
    -- @value: boolean
    show_color_column = false,

    ----------------------------------------------------------------------------
    -- Indentation
    ----------------------------------------------------------------------------

    -- Insert spaces instead of tabs
    -- @value: boolean
    insert_spaces = true,

    -- Number of spaces to use for each level of indentation
    -- @value: integer
    indent_size = 4,

    -- Number of spaces to render for a <Tab>
    -- @value: integer
    tab_size = 4,

    -- UNUSED
    -- Show guidelines for nested blocks.
    -- @value: boolean
    indent_guides = false,

    ----------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------

    -- Enable Language Server Protocol
    -- @value: boolean
    lsp_enabled = true,

    -- List your installed servers
    -- @value: [String]
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    servers = { "lua_ls", "pylsp", "gopls", "nimls" },

    -- Enable inline error/hint text
    -- @value: boolean
    virtual_text_enabled = false,

    -- Only underline code for this severity level or higher
    -- @value: string: HINT < INFO < WARN < ERROR
    -- @default: hint
    lsp_underline_level = "warn",

    -- Milliseconds to wait before LSP updates
    -- @value: integer
    -- @default: 150
    lsp_debounce = 300,

    -- UNUSED
    -- @value: boolean
    lsp_document_highlight = true,

    -- Enable autocomplete
    -- @value: boolean
    code_auto_complete = false,

    -- Number of items shown in autocomplete suggestions
    -- @value: integer
    compe_items = 10,

    -- Width of LSP window
    -- @value: string: single, double
    lsp_window_borders = "single",

    ----------------------------------------------------------------------------
    -- Start menu
    ----------------------------------------------------------------------------

    -- ASCII art for header and footer
    -- @value: string?: cowsay, nvim_block, nvim_sharp, nvim_roman
    st_header = "nvim_sharp",
    st_footer = nil,

    -- Position of header and footer
    -- @value: string?: center, pad
    -- @default: pad
    st_header_pos = "center",
    st_footer_pos = nil,

    ----------------------------------------------------------------------------
    -- End
    ----------------------------------------------------------------------------
}

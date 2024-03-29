return {
    ----------------------------------------------------------------------
    --- Theming
    ----------------------------------------------------------------------

    -- Set theme; Not compatible with all color schemes
    -- @value: string: light, dark
    color_theme = "dark",

    -- Set theme; Not compatible with all color schemes
    -- @value: string: gruvbox, onenord
    color_scheme = "gruvbox",

    ----------------------------------------------------------------------
    --- General
    ----------------------------------------------------------------------

    -- Enable mouse in Neovim
    -- @value: boolean
    enable_mouse = true,

    -- Time in milliseconds to wait for a mapped sequence to complete.
    -- @value: integer
    timeoutlen = 400,

    -- Debounce swapfile writes for this many milliseconds
    -- @value: integer
    updatetime = 1000,

    -- Useful to align text.
    -- @value: integer
    color_column = 81,

    -- Show colorcolumn by default?
    -- @value: boolean
    show_color_column = false,

    -- Keep the cursor as a block in insert mode.
    -- @value: boolean
    cursor_block = false,

    -- Cache undo history and restore it to buffer on file load
    -- @value: boolean
    remember_undo_history = false,

    -- Turn this off for "big" files
    -- @value: boolean
    use_swapfile = true,

    -- Number of screen lines to use for the command-line.
    -- @value: integer > 0
    cmdheight = 1,

    -- Minimal number of screen lines to keep above and below the cursor.
    -- @value: number
    scrolloff = 5,

    -- Show the line number relative to the line with the cursor in front of
    -- each line.
    -- @value: boolean
    relative_number = false,

    -- Highlight the screen line of the cursor.
    -- @value: boolean
    cursor_line = false,

    -- When on, lines longer than the width of the window will wrap and
    -- displaying continues on the next line.
    -- @value: boolean
    word_wrap = true,

    -- Keep the last cursor position when reopening a buffer.
    -- @value: boolean
    preserve_cursor = true,

    -- Hightlight text when yanked.
    -- @value: boolean
    highlight_yank = true,

    -- Chars for trailing space, eol, tab, etc.
    -- @value: boolean
    list_chars = true,

    -- Basic trim of trailing whitespace.
    -- @value: boolean
    trim_trailing_space = true,

    -- Format on save.
    -- @value: boolean
    format_on_save = true,

    -- File explorer side.
    -- @value: string: left, right
    -- UNUSED
    explorer_side = "left",

    -- Use these keys for easymotion hints
    -- @value: string
    -- @default: etovxqpdygfblzhckisuran
    easymotion_keys = "etovxqpdygfblzhckisuran",

    ----------------------------------------------------------------------
    -- Indentation
    ----------------------------------------------------------------------

    -- Insert spaces instead of tabs
    -- @value: boolean
    insert_spaces = true,

    -- Number of spaces to use for each level of indentation
    -- @value: number
    indent_size = 4,

    -- Number of spaces to render for a <Tab>
    -- @value: number
    tab_size = 4,

    -- Show guidelines for nested blocks.
    -- @value: boolean
    -- UNUSED
    indent_guides = false,

    ----------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------

    -- Enable Language Server Protocol
    -- @value: boolean
    lsp_enabled = false,

    -- Milliseconds to wait before LSP updates
    -- @value: integer
    lsp_debounce = 150,

    -- ???
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

    ----------------------------------------------------------------------
    -- Startify
    ----------------------------------------------------------------------

    -- Choose your startify footer.
    -- @value: string?
    startify_footer = nil,

    -- Position of the startify header and footer.
    -- @options: center, pad
    startify_banner_position = "center",

    -- Choose your startify header.
    -- @options: set it equal to "cowsay" to get a cow and a random quote.
    -- You can also set an ascii art as header.
    startify_header = {
        "ooooo      ooo oooooooooooo   .oooooo.   oooooo     oooo ooooo ooo        ooooo",
        "`888b.     `8' `888'     `8  d8P'  `Y8b   `888.     .8'  `888' `88.       .888'",
        " 8 `88b.    8   888         888      888   `888.   .8'    888   888b     d'888 ",
        " 8   `88b.  8   888oooop    888      888    `888. .8'     888   8 Y88. .P  888 ",
        " 8     `88b.8   888         888      888     `888.8'      888   8  `888'   888 ",
        " 8       `888   888       o `88b    d88'      `888'       888   8    Y     888 ",
        "o8o        `8  o888ooooood8  `Y8bood8P'        `8'       o888o o8o        o888o",
    },
}

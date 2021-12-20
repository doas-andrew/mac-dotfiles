return {
    ----------------------------------------------------------------------
    --- General Settings
    ----------------------------------------------------------------------
    -- Time in milliseconds to wait for a mapped sequence to complete.
    -- @value: number
    timeoutlen = 400,

    -- If in this many milliseconds nothing is typed the swap file will be
    -- written to disk.
    -- @value: number
    updatetime = 300,

    -- Useful to align text.
    -- @value: number
    colorcolumn = 0,

    -- Keep the cursor as a block in insert mode.
    -- @value: boolean
    cursor_block = false,

    -- Number of screen lines to use for the command-line.
    -- @value: number
    cmdheight = 1,

    -- Minimal number of screen lines to keep above and below the cursor.
    -- @value: number
    scrolloff = 5,

    -- Number of spaces to use for each step of (auto)indent and number
    -- of spaces that a <Tab> counts for.
    -- @value: number
    indent_size = 4,

    -- Show the line number relative to the line with the cursor in front of
    -- each line.
    -- @value: boolean
    relativenumber = false,

    -- Highlight the screen line of the cursor.
    -- @value: boolean
    cursorline = false,

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
    listchars = false,

    -- Adds indentation guides to all lines.
    -- @value: boolean
    indent_guides = false,

    -- Basic trim of trailing white space.
    -- @value: boolean
    trim_trailing_space = true,

    -- Format on save.
    -- @value: boolean
    format_on_save = true,

    -- File explorer side.
    -- @value: string (left or right)
    explorer_side = "right",
    
    ----------------------------------------------------------------------
    -- Startify
    ----------------------------------------------------------------------
    -- Choose your startify footer.
    -- @value: string
    startify_footer = "Better with Lua",

    -- Position of the startify header.
    -- @options: center, pad
    startify_header_position = "center",

    -- Choose your startify header.
    -- @options: set it equal to "cowsay" to get a cow and a random quote.
    -- You can also set an ascii art as header.
    startify_header_ascii = {
        "ooooo      ooo oooooooooooo   .oooooo.   oooooo     oooo ooooo ooo        ooooo",
        "`888b.     `8' `888'     `8  d8P'  `Y8b   `888.     .8'  `888' `88.       .888'",
        " 8 `88b.    8   888         888      888   `888.   .8'    888   888b     d'888 ",
        " 8   `88b.  8   888oooop    888      888    `888. .8'     888   8 Y88. .P  888 ",
        " 8     `88b.8   888         888      888     `888.8'      888   8  `888'   888 ",
        " 8       `888   888       o `88b    d88'      `888'       888   8    Y     888 ",
        "o8o        `8  o888ooooood8  `Y8bood8P'        `8'       o888o o8o        o888o",
    },
}

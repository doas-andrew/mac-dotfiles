return {
    -- Show buffers as tabs
    "romgrk/barbar.nvim",
    lazy = false,
    config = {
        -- Enable/disable animations
        animation = false,

        -- Auto-hide the tab bar when there is a single buffer
        auto_hide = true,

        -- Show the current/total tabpages indicator (top right corner)
        tabpages = true,

        -- Enable clickable tabs
        -- left-click    go to buffer
        -- middle-click  delete buffer
        clickable = true,

        -- Excludes buffers from the tabline
        -- exclude_ft = {'javascript'},
        -- exclude_name = {'package.json'},

        icons = {
            button = "",
            gitsigns = {
                --  added =   { enabled = true, icon = '+' },
                --  changed = { enabled = true, icon = '~' },
                --  deleted = { enabled = true, icon = '-' },
            },

            separator = { left='▎', right=' ' },

            inactive = {
                separator = { left='▎', right=' ' },
            },

            modified = {
                --  button = "",
                separator = { left='▎', right='' },
            },
        },

        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = false,
        insert_at_start = false,

        -- Sets the padding width with which to surround each tab
        minimum_padding = 1,
        maximum_padding = 1,

        -- Sets the maximum buffer name length.
        maximum_length = 20,

        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,

        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustement
        -- for other layouts.
        -- letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        -- where X is the buffer number. But only a static string is accepted here.
        no_name_title = nil,
    },
}

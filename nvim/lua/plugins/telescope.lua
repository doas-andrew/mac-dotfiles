local ignore = {
    "tmp",
    ".git",
    "node_modules",
    "package-lock.json",
    "_build",
    ".mkvtest",
    ".png",
    ".jpg",
    ".jpeg",
    ".webp",
    ".pdf",
    ".mp3",
    ".mp4",
    ".m4a",
    ".opus",
    ".flac",
    ".doc",
    ".zip",
    ".odt",
    ".ots",
    ".docx",
    ".xlsx",
    ".xls",
    ".pptx",
    ".dxvk",
    ".rpf",
    ".dll",
    ".kdbx",
    ".exe",
}

local M = {}

M.config = function()
    local load_extension = require("telescope").load_extension
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")

    require("telescope").setup({
        defaults = {
            prompt_prefix = "  ",
            selection_caret = "❯ ",
            mappings = {
                i = {
                    ["?"] = actions.which_key,
                    ["<M-p"] = layout.toggle_preview,
                    -- ["<M-CR>"] = actions.select_default,
                    ["<M-w>"]  = actions.close,
                    ["<Esc>"]  = actions.close,
                    ["<M-i>"]  = actions.move_selection_previous,
                    ["<M-k>"]  = actions.move_selection_next,
                    ["<M-I>"]  = actions.cycle_history_prev,
                    ["<M-K>"]  = actions.cycle_history_next,
                    -- ["<M-BS>"]
                },
                n = {
                    ["<M-w>"] = actions.close,
                    ["<Esc>"] = actions.close,
                    i = actions.move_selection_previous,
                    k = actions.move_selection_next,
                },
            },
        },

        pickers = {

            live_grep = {
                -- "Search all"
                file_ignore_patterns = ignore,
                layout_config = {
                    height = 0.90,
                    width = 0.90,
                    preview_width = 0.60
                },
            },

            find_files = {
                -- "Ctrl-p"
                file_ignore_patterns = ignore,
                theme = "dropdown",
                sorting_strategy = "ascending",
                previewer = false,
                layout_config = { height = 25 },
                find_command = {
                    "fd",
                    "--type", "f",
                    "--type", "l",
                    "--hidden",
                    "--no-ignore"
                },
                mappings = {
                    i = {
                        ["<M-p>"] = actions.close,
                    },
                    n = {
                        ["<M-p>"] = actions.close,
                    },
                },

            },

            buffers = {
                theme = "ivy",
                layout_config = { height = 20, preview_width = 0.5 },
                sort_lastused = true,
                show_all_buffers = true,
                ignore_current_buffer = true,
                mappings = {
                    i = {
                        ["<M-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["<M-d>"] = actions.delete_buffer,
                    },
                },
            },
        },

        extensions = {

            ["zf-native"] = {
                -- options for sorting file-like items
                file = {
                    enable            = true, -- override default telescope file sorter
                    highlight_results = true, -- highlight matching text in results
                    match_filename    = true, -- enable zf filename match priority
                },
                -- options for sorting all other items
                generic = {
                    enable            = true,  -- override default telescope generic item sorter
                    highlight_results = true,  -- highlight matching text in results
                    match_filename    = false, -- disable zf filename match priority
                },
            },

            file_browser = {
                mappings = {
                    i = {
                        ["<M-d>"] = actions.close,
                    },
                    n = {
                        ["<M-d>"] = actions.close,
                    },
                },
            },

            media_files = {
                -- filetypes = { "png", "webp", "webm", "jpg", "jpeg" },
                find_cmd = "fd",
            },
        },
    })

    load_extension("file_browser")
    load_extension("media_files")
    load_extension("zf-native")
end

return M

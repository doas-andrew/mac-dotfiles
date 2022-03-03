return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
        local ignore = {
            ".git", "_build", "node_modules",
            ".png", ".jpg", ".jpeg", ".webp",
            ".mp3", ".m4a", ".opus", ".flac",
            ".pdf", ".doc", ".docx", ".odt",
            ".xls", ".xlsx", ".ots",
            ".mkv", ".mp4",
            ".pptx",
            ".dll",
            ".kdbx",
            ".exe", ".zip",
        }

        local telescope  = require("telescope")
        local actions    = require("telescope.actions")
        local layout     = require("telescope.actions.layout")
        local fb_actions = telescope.extensions.file_browser.actions

        telescope.setup {
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "❯ ",
                mappings = {
                    i = {
                        ["?"] = actions.which_key,
                        ["<M-p"] = layout.toggle_preview,
                        ["<M-CR>"] = actions.select_default,
                        ["<M-w>"] = actions.close,
                        ["<Esc>"] = actions.close,
                        ["<M-i>"] = actions.move_selection_previous,
                        ["<M-k>"] = actions.move_selection_next,
                        ["<M-I>"] = actions.cycle_history_prev,
                        ["<M-K>"] = actions.cycle_history_next,
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
                    },
                },
            },

            extensions = {

                aerial = {
                    -- Display symbols as <root>.<parent>.<symbol>
                    show_nesting = {
                        ['_'] = false, -- This key will be the default
                        json = true,   -- You can set the option for specific filetypes
                        yaml = true,
                    },
                },

                ["zf-native"] = {
                    -- options for sorting file-like items
                    file = {
                        enable            = true,  -- override default telescope file sorter
                        highlight_results = true,  -- highlight matching text in results
                        match_filename    = false, -- enable zf filename match priority
                    },
                    -- options for sorting all other items
                    generic = {
                        enable            = true,  -- override default telescope generic item sorter
                        highlight_results = true,  -- highlight matching text in results
                        match_filename    = false, -- disable zf filename match priority
                    },
                },

                file_browser = {
                    theme = "ivy",
                    layout_config = { height = 16, preview_width = 0.5 },
                    grouped = true,
                    previewer = false,
                    depth = 1,
                    --  auto_depth = true,
                    hidden = true,
                    mappings = {
                        i = {
                            ["<M-a>"] = fb_actions.create,
                            ["<M-d>"] = actions.close,
                            ["<M-x>"] = fb_actions.remove,
                        },
                    },
                },
            },
        }

        -- telescope.load_extension("notify")
        telescope.load_extension("file_browser")
    end,
}

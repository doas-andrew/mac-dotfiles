local M = {}

M.config = function()
    vim.cmd([[
        autocmd User Startified execute 'nunmap <buffer>' 'i'
        autocmd User Startified execute 'nunmap <buffer>' 'e'
    ]])
    -- vim.api.nvim_create_autocmd({ "User", "Startified" }, {
        -- desc = "Unmap i",
        -- command = "'nunmap <buffer>' 'i'"
    -- })

    vim.g.startify_lists = {
        { type = "bookmarks", header = { "   Bookmarks"    } },
        { type = "files",     header = { "   Recent Files" } },
        -- { type = "sessions",  header = { "   Sessions"     } },
        -- { type = "commands",  header = { "   Commands"     } },
    }
    vim.g.startify_bookmarks = {
        { al  = "~/.config/alacritty/alacritty.yml"       },
        { esp = "~/.config/espanso/default.yml"           },
        { hx  = "~/dotfiles/helix/config.toml"            },
        { nix = "~/dotfiles/nixos/configuration.nix"      },
        { ob  = "~/.config/openbox/rc.xml"                },
        { po  = "~/.config/polybar/config.ini"            },
        { st  = "~/.config/nvim/lua/plugins/startify.lua" },
        { tm  = "~/.config/tmux/tmux.conf"                },
        { vc  = "~/.config/nvim/lua/core/config.lua"      },
        { vm  = "~/.config/nvim/lua/core/mappings.lua"    },
        { vp  = "~/.config/nvim/lua/plugins/init.lua"     },
        { xm  = "~/dotfiles/xmonad/xmonad.hs"             },
        { z   = "~/dotfiles/zsh/zshrc"                    },
    }
    vim.g.startify_commands = {
        { "Find files",      ":Telescope fd"        },
        { "Recent files",    ":Telescope oldfiles"  },
        { "Execute command", ":Telescope commands"  },
        { "Help Tags",       ":Telescope help_tags" },
        { "Sync Plugins",    ":PackerSync"          },
        { "Planets",         ":Telescope planets"   },
    }

    vim.g.startify_change_to_vcs_root     =  1  -- Similar to Vim-rooter
    vim.g.startify_enable_special         =  0  -- Get rid of empy buffer on quit
    vim.g.startify_files_number           = 10  -- The number of files to list.
    vim.g.startify_fortune_use_unicode    =  1  -- Unicode
    vim.g.startify_padding_left           =  3  -- The number of spaces used for left padding.
    vim.g.startify_session_autoload       =  1  -- Automatically load session if neovim starts in a directory with Session.vim
    vim.g.startify_session_delete_buffers =  1  -- Let Startify handle buffers
    vim.g.startify_session_persistence    =  1  -- Automatically update sessions
    vim.g.startify_session_sort           =  1  -- Sort sessions by modification time

    -- Header and footer
    if vim.g.code_startify_footer ~= nil then
        vim.g.startify_custom_footer = "startify#center([g:code_startify_footer])"
    end
    if vim.g.code_startify_header_ascii ~= nil then
        local posi = vim.g.startify_header_position or "center"
        if vim.g.startify_header_ascii == "cowsay" then
            vim.g.startify_custom_header = "startify#" .. posi .. "(startify#fortune#cowsay())"
        else
            vim.g.startify_custom_header = "startify#" .. posi .. "(g:code_startify_header_ascii)"
        end
    end
end

return M

-- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
local wezterm = require 'wezterm'
local fn = require 'library'
local act = wezterm.action
local acb = wezterm.action_callback

local keys = {}
for i = 97, 122 do -- a to z
    local key = string.char(i)
    table.insert(keys, {
        mods = 'CMD', key = key,
        action = act.SendKey { mods = 'ALT', key = key }
    })
    table.insert(keys, {
        mods = 'CMD|SHIFT', key = key,
        action = act.SendKey { mods = 'ALT|SHIFT', key = key }
    })
end

return {
    leader = {
        mods = 'CMD',
        key = 'q',
        timeout_milliseconds = 2000,
    },
    keys = fn.combine(keys, {
        fn.ignore_editor {
            mods = 'CMD', key = ',',
            action = act.ActivateCopyMode
        },
        fn.ignore_editor {
            mods = 'CMD', key = 's',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'u',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'i',
            action = act.ActivatePaneDirection 'Up'
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'k',
            action = act.ActivatePaneDirection 'Down'
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'j',
            action = act.ActivatePaneDirection 'Left'
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'l',
            action = act.ActivatePaneDirection 'Right'
        },
        fn.ignore_editor {
            mods = 'CMD', key = 'Backspace',
            action = act.SendKey { mods = 'ALT', key = 'Backspace' }
        },
        fn.editor_only {
            mods = 'CTRL', key = 'i',
            action = act.Multiple {
                act.SendKey { mods = 'CTRL', key = 'b' },
                act.SendKey { key = 'i' },
            },
        },
        {
            mods = 'CTRL', key = 't',
            action = act.SpawnTab('CurrentPaneDomain'),
        },
        fn.ignore_editor {
            mods = 'CTRL', key = 'j',
            action = act.ActivateTabRelative(-1)
        },
        fn.ignore_editor {
            mods = 'CTRL', key = 'l',
            action = act.ActivateTabRelative(1)
        },
        fn.ignore_editor {
            mods = 'CTRL', key = 'v',
            action = act.PasteFrom 'Clipboard'
        },
        {
            mods = 'CTRL|SHIFT', key = 'LeftArrow',
            action = act.MoveTabRelative(-1)
        },
        {
            mods = 'CTRL|SHIFT', key = 'RightArrow',
            action = act.MoveTabRelative(1)
        },
        fn.ignore_editor {
            mods = 'SHIFT', key = 'LeftArrow',
            action = act.AdjustPaneSize { 'Left', 5 }
        },
        fn.ignore_editor {
            mods = 'SHIFT', key = 'RightArrow',
            action = act.AdjustPaneSize { 'Right', 5 }
        },
        fn.ignore_editor {
            mods = 'SHIFT', key = 'DownArrow',
            action = act.AdjustPaneSize { 'Down', 2 }
        },
        fn.ignore_editor {
            mods = 'SHIFT', key = 'UpArrow',
            action = act.AdjustPaneSize { 'Up', 2 }
        },
        {
            mods = 'LEADER', key = 'd',
            action = act.ShowDebugOverlay
        },
        {
            mods = 'LEADER', key = 'i',
            action = acb(function(win, pane)
                -- tail -f $XDG_RUNTIME_DIR/wezterm/wezterm-gui-log-
                wezterm.log_info(
                    '\nWindowID:', win:window_id(),
                    '\nPaneID:', pane:pane_id(),
                    '\nMuxTab:', pane:tab()
                )
            end),
        },
        {
            mods = 'LEADER', key = 'p',
            action = act.ActivateCommandPalette
        },
        {
            mods = 'LEADER', key = 'x',
            action = act.CloseCurrentPane { confirm = true }
        },
        {
            mods = 'LEADER|CMD', key = 's',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        {
            mods = 'LEADER|CMD', key = 'u',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
            mods = 'LEADER|CTRL', key = 'j',
            action = act.ActivateTabRelative(-1)
        },
        {
            mods = 'LEADER|CTRL', key = 'l',
            action = act.ActivateTabRelative(1)
        },
    }),
    key_tables = {
        copy_mode = {
            { mods = 'NONE', key = 'i', action = act.CopyMode 'MoveUp' },
            { mods = 'NONE', key = 'k', action = act.CopyMode 'MoveDown' },
            { mods = 'NONE', key = 'j', action = act.CopyMode 'MoveLeft' },
            { mods = 'NONE', key = 'l', action = act.CopyMode 'MoveRight' },
            { mods = 'CTRL', key = 'i', action = act.CopyMode { MoveByPage = -0.5 }},
            { mods = 'CTRL', key = 'k', action = act.CopyMode { MoveByPage =  0.5 }},
        },
    },
}

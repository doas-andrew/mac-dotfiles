local wezterm = require 'wezterm'
local keys = require 'keys'
local fn = require 'library'
local act = wezterm.action
local config = {}

-- Newer versions of wezterm use config_builder,
-- which provides better error messages.
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Environment
config.set_environment_variables = {
    MY_WEZTERM_INDICATOR = '1'
}

-- Font
config.font = wezterm.font 'JetBrains Mono NL'
config.warn_about_missing_glyphs = false
config.font_size = 14
config.line_height = 1.2

-- Keys
local defaults = wezterm.gui.default_key_tables()
config.leader = keys.leader
config.keys = keys.keys
config.key_tables = {
    copy_mode = fn.combine(defaults.copy_mode , keys.key_tables.copy_mode)
}

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Kanagawa (Gogh)'
config.colors = {
    selection_bg = '#2D4F67',
    selection_fg = '#C8C093',
    tab_bar = {
        background = '#1F1F28',
        active_tab = {
            bg_color = '#C0A36E',
            fg_color = '#1F1F28',
        },
        inactive_tab = {
            bg_color = '#1F1F28',
            fg_color = '#DCD7BA',
        },
        new_tab = {
            bg_color = '#1F1F28',
            fg_color = '#DCD7BA',
        },
    },
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
config.status_update_interval = 1000

-- config.window_decorations = 'RESIZE'

config.window_padding = {
  left   = 10,
  right  = 10,
  top    = 10,
  bottom =  0,
}

-- alt + number to activate that tab
for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i-1),
    })
end

wezterm.on('update-right-status', function(win, _)
    local prefix = ''

    if win:leader_is_active() then
        prefix = ' ' .. '⚡' .. ' '
    end

    win:set_left_status(wezterm.format {
        { Text = prefix },
    })
end)

return config

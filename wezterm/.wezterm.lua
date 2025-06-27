local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 15

config.enable_tab_bar = true
config.window_decorations = "RESIZE"

config.color_scheme = "Tokyo Night"


config.enable_wayland = false

wezterm.on('window-focus-changed', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not window:is_focused() then
    overrides.window_background_opacity = 0.90
  else
    overrides.window_background_opacity = 0.95
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
  {
    key = '\\',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'h',
    mods = 'ALT',
    action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'j',
    mods = 'ALT',
    action = act.AdjustPaneSize { 'Down', 5 },
  },
  { key = 'k',
    mods = 'ALT', action = act.AdjustPaneSize { 'Up', 5 } },
  {
    key = 'l',
    mods = 'ALT',
    action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'x',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config

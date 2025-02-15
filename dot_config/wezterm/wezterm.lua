-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

--config.color_scheme = 'Tomorrow (light) (terminal.sexy)'
--config.color_scheme = 'Tokyo Night Day'
--config.color_scheme = 'Catppuccin Latte'
config.color_scheme = 'Rosé Pine Dawn (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12
--config.font = wezterm.font 'Cascadia Code PL'
config.scrollback_lines = 10000

config.default_prog = { 'bash', '-c', 'distrobox enter fedora' }
-- Remove title bar windows decoration
-- config.window_decorations = "RESIZE"

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.5,
}

config.initial_rows = 32
config.initial_cols = 100

config.keys = {
  -- Activate the tab navigator UI in the current tab. The tab navigator displays
  -- a list of tabs and allows you to select and activate a tab from that list.
  --  { key = 'F9', mods = 'ALT', action = wezterm.action.ShowTabNavigator },
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}
-- Background gradient
-- config.window_background_gradient = {
--   preset = "Cividis",
--   -- Specifices a Linear gradient starting in the top left corner.
--   orientation = { Linear = { angle = -45.0 } },
-- }


config.launch_menu = {
  {
    label = 'bash',
    args = { 'bash' },
  },
  {
    label = 'powercli',
    args = { 'bash', '-c', 'podman run --rm -it vmware/powerclicore' },
  },
  {
    label = 'powershell',
    args = { 'bash', '-c', 'podman run --mount type=volume,src=powershell_scripts,dst=/home -it powershell:latest' },
  },
  {
    label = 'distrobox fedora',
    args = { 'bash', '-c', 'distrobox enter fedora' },
  },
  {
    label = 'distrobox java',
    args = { 'bash', '-c', 'distrobox enter java' },
  },
  {
    label = 'distrobox python',
    args = { 'bash', '-c', 'distrobox enter python' },
  },
  {
    label = 'yazi',
    args = { 'bash', '-c', 'distrobox enter fedora --additional-flags "--env EDITOR=/usr/bin/nvim" -e yazi' },
  },
}

-- and finally, return the configuration to wezterm
return config

local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14
config.line_height = 1

config.color_scheme = 'Kanagawa (Gogh)'

config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.keys = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

for i = 1, 8 do
  table.insert(
    config.keys,
    { key = tostring(i), mods = 'ALT', action = act.ActivateTab(i - 1) }
  )
end

local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config

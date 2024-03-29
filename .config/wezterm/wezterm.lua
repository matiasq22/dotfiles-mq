local wezterm = require 'wezterm'
local keys = require 'keys'

return {
  -- General Options
  audible_bell = 'Disabled',
  automatically_reload_config = true,
  bold_brightens_ansi_colors = true,
  check_for_updates = true,
  debug_key_events = false,
  default_cursor_style = 'SteadyBar',
  enable_scroll_bar = false,
  enable_wayland = false,
  force_reverse_video_cursor = true,
  line_height = 1.0,
  scrollback_lines = 100000,
  show_update_window = false,

  -- Color Scheme
  color_scheme = 'Catppuccin Mocha',

  -- Font
  font_size = 12.0,
  font = wezterm.font {
    family = 'CaskaydiaCove Nerd Font',
    stretch = 'Normal',
    weight = 'Regular',
  },

  -- Key Bindings
  disable_default_key_bindings = true,
  keys = keys,

  -- Tab Bar
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- Window
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 1.0,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'NONE',
  window_padding = {
    top = 15,
    right = 15,
    bottom = 15,
    left = 15,
  },
}

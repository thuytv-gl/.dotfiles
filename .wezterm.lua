local wezterm = require("wezterm");
local colors = {
    gutter = "#16171d",
    cursor = "#2C323C",
    element = "#404449",
    split = "#282c34",
    black = "#13131a",
    grey = "#3E4452",
    red = "#ED95A8",
    brightRed = "#EF5350",
    green = "#C3E88D",
    brightGreen = "#C3E88D",
    yellow = "#FFCB6B",
    brightYellow = "#F78C6C",
    blue = "#82B1FF",
    brightBlue = "#939EDE",
    purple = "#C792EA",
    brightPurple = "#FF45AE",
    cyan = "#89DDFF",
    brightCyan = "#20D6E3",
    white = "#ECEFF1",
    brightWhite = "#697098",
    darkWhite = "#F8F8F2",
}

local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  default_prog = { 'cmd.exe', '/C', 'D:\\programs\\msys64\\usr\\bin\\bash.exe' },
  mux_env_remove = {
    "SSH_AUTH_SOCK",
    "SSH_CLIENT",
    "SSH_CONNECTION",
    "GPG_TTY",
  },
  -- font = wezterm.font_with_fallback({ "Dank Mono", "codicon" }),
  allow_square_glyphs_to_overflow_width = "Always",
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  harfbuzz_features = {"liga=0"},
  font_size = 12.0,
  line_height = 1.1,

  enable_scroll_bar = false,
  check_for_updates = false,
  window_close_confirmation = "NeverPrompt",
  native_macos_fullscreen_mode = true,
  warn_about_missing_glyphs = false,
  bold_brightens_ansi_colors = false,
  window_decorations = "TITLE | RESIZE",

  enable_tab_bar  = false,
  tab_bar_at_bottom = false,
  tab_max_width = 24,
  tab_bar_style = {
    active_tab_left = nil,
    active_tab_right = nil,
    inactive_tab_left = nil,
    inactive_tab_right = nil,
    inactive_tab_hover_left = nil,
    inactive_tab_hover_right = nil,
  },

  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 10,
    bottom = 1,
  },

  colors = {
    background = colors.black,
    foreground = colors.white,
    cursor_border = colors.grey,
    cursor_fg = colors.grey,
    cursor_bg = colors.white,
    selection_bg = colors.grey,
    selection_fg = colors.white,
    split = colors.split,
    ansi = {
      colors.black,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.purple,
      colors.cyan,
      colors.white,
    },
    brights = {
      colors.grey,
      colors.brightRed,
      colors.brightGreen,
      colors.brightYellow,
      colors.brightBlue,
      colors.brightPurple,
      colors.brightCyan,
      colors.brightWhite,
    },
    tab_bar = {
      background = colors.black,
      active_tab = {
        bg_color = colors.black,
        fg_color = colors.yellow,
        intensity = "Bold",
      },
      inactive_tab = {
        bg_color = colors.black,
        fg_color = colors.brightWhite,
      },
      inactive_tab_hover = {
        bg_color = colors.black,
        fg_color = colors.blue,
      },
      new_tab = {
        bg_color = colors.black,
        fg_color = colors.blue,
      },
    }
  },

  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString="\x01" }) },
    { key = "%", mods = "LEADER|SHIFT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "\"", mods = "LEADER|SHIFT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
    { key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "l", mods = "LEADER", action = "ActivateLastTab" },
    { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
    { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
    { key = "[", mods = "LEADER", action = "ActivateCopyMode" },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    { key = "s", mods = "LEADER", action = "ShowLauncher" },

    { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0}) },
    { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1}) },
    { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2}) },
    { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3}) },
    { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4}) },
  },
}

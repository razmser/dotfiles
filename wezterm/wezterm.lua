local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end
local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

config.color_scheme = 'Catppuccin Macchiato'
config.hide_tab_bar_if_only_one_tab = true
-- if is_darwin() then
--   config.font = wezterm.font 'Hack Nerd Font Mono'
-- else
--   config.font = wezterm.font 'HackNerdFont Mono'
-- end
-- init table
config.keys = {}

-- padding annoys me becase colour is often different from app
config.enable_scroll_bar = false
config.window_padding = {
  left = 6, -- to center in fullscreen on my mac
  right = 0,
  top = 0,
  bottom = 0,
}


-- Mac OS has Super + C/P for Copy/Paste so we don't need this hacks
if not is_darwin() then
  -- Ctrl + C works as copy when something is selected, otherwise it's interrupt
  -- based on https://github.com/wez/wezterm/discussions/2426#discussioncomment-4197449
  table.insert(config.keys, {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local sel = window:get_selection_text_for_pane(pane)
      if (not sel or sel == '') then
        window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
      else
        window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' }, pane)
        window:perform_action(act.ClearSelection, pane)
      end
    end),
  })
  table.insert(config.keys,
    { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' }
  )
  table.insert(config.keys,
    { 
      key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
    }
  )
  table.insert(config.keys,
    { 
      key = 'V', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
    }
  )
end

table.insert(config.keys, {
  key = 'F11',
  action = wezterm.action.ToggleFullScreen,
})
if is_linux() then
  -- fullscreen doesn't work on wayland, so use X11 for now
  -- https://github.com/wez/wezterm/issues/4665
  config.enable_wayland = false
end
config.native_macos_fullscreen_mode = true


return config


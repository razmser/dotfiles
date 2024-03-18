local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = 'Catppuccin Frappe'
config.hide_tab_bar_if_only_one_tab = true

-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- Mac OS has Super + C/P for Copy/Paste so we don't need this hacks
if not is_darwin() then
  config.keys = {
    -- Ctrl + C works as copy when something is selected, otherwise it's interrupt
    -- based on https://github.com/wez/wezterm/discussions/2426#discussioncomment-4197449
    {
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
    },
    { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
    },
    { key = 'V', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
    },
  }
end

return config


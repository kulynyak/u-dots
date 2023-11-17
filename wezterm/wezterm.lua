local wezterm = require("wezterm")
wezterm.log_info("Config file " .. wezterm.config_file)
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	return zoomed .. index .. tab.active_pane.title
end)

-- wezterm.on("update-right-status", function(window, pane)
--     local date = wezterm.strftime("%Y-%m-%d %H:%M:%S");

--     -- Make it italic and underlined
--     window:set_right_status(wezterm.format({{
--         Attribute = {
--             Underline = "Single"
--         }
--     }, {
--         Attribute = {
--             Italic = true
--         }
--     }, {
--         Text = "Hello " .. date
--     }}));
-- end);

wezterm.on("window-config-reloaded", function(window, pane)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

local window_padding = 0
local act = wezterm.action
return {
	check_for_updates = true,
	-- color_scheme = "AdventureTime",
	-- color_scheme = "Solarized Dark Higher Contrast",
	-- color_scheme = "Paraiso Dark",
	-- color_scheme = "Peppermint",
	-- color_scheme = "Nocturnal Winter",
	-- color_scheme = "Galizur",
	-- color_scheme = "Guezwhoz",
	-- color_scheme = "Blue Matrix",
	-- color_scheme = "3024 Night",
	-- color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Catppuccin Macchiato",
	color_scheme = "Catppuccin Frappe",
	-- color_scheme = "Catppuccin Latte",

	colors = {
		-- The color of the split lines between panes
		split = "#AABBAA",
	},
	initial_cols = 195,
	initial_rows = 84,
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font Mono",
		"Hack Nerd Font Mono",
		"JetBrainsMono NF",
		"Fira Code Mono",
	}),
	font_size = 12.5,
	enable_scroll_bar = false,
	scrollback_lines = 5000,
	front_end = "OpenGL",
	window_background_opacity = 0.97,
	text_background_opacity = 1.00,
	window_padding = {
		left = window_padding,
		right = window_padding,
		top = window_padding,
		bottom = window_padding,
	},
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 0.95,
		brightness = 0.65,
	},
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	-- default_cursor_style = "BlinkingBlock",
	-- cursor_blink_rate = 700,
	disable_default_key_bindings = true,
	leader = { key = "a", mods = "SUPER" },
	keys = {
		-- open wezterm config
		{
			key = ",",
			mods = "SUPER",
			action = act.SpawnCommandInNewTab({
				cwd = os.getenv("WEZTERM_CONFIG_DIR"),
				set_environment_variables = { TERM = "screen-256color" },
				args = { "/opt/homebrew/bin/nvim", os.getenv("WEZTERM_CONFIG_FILE") },
			}),
		},
		-- font
		{ key = "0", mods = "CTRL|SUPER", action = act.ResetFontSize },
		{ key = "=", mods = "CTRL|SUPER", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL|SUPER", action = act.DecreaseFontSize },

		-- show tab bar navigator
		{ key = "t", mods = "SUPER|SHIFT", action = act.ShowTabNavigator },
		-- enter debug console
		{ key = "l", mods = "LEADER|CTRL", action = act.ShowDebugOverlay },

		-- paste from the clipboard
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		-- paste from the primary selection
		{ key = "v", mods = "SUPER", action = act.PasteFrom("PrimarySelection") },
		-- copy to clipboard
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SUPER", action = act.CopyTo("ClipboardAndPrimarySelection") },

		{ key = "a", mods = "LEADER|CTRL", action = act({ SendString = "\x01" }) },
		{ key = "-", mods = "LEADER", action = act.SplitPane({ direction = "Down" }) },
		{
			key = "DownArrow",
			mods = "LEADER",
			action = act.SplitPane({ direction = "Down", size = { Percent = 15 }, top_level = false }),
		},
		{
			key = "UpArrow",
			mods = "LEADER",
			action = act.SplitPane({ direction = "Up", size = { Percent = 15 } }),
		},

		{
			key = "\\",
			mods = "LEADER",
			action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },

		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },

		{ key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },

		{ key = "LeftArrow", mods = "ALT|SUPER", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "RightArrow", mods = "ALT|SUPER", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "UpArrow", mods = "ALT|SUPER", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "ALT|SUPER", action = act({ ActivatePaneDirection = "Down" }) },

		{ key = "h", mods = "SUPER|CTRL", action = act({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "j", mods = "SUPER|CTRL", action = act({ AdjustPaneSize = { "Down", 1 } }) },
		{ key = "k", mods = "SUPER|CTRL", action = act({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "l", mods = "SUPER|CTRL", action = act({ AdjustPaneSize = { "Right", 1 } }) },

		{ key = "1", mods = "SUPER", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "SUPER", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "SUPER", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "SUPER", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "SUPER", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "SUPER", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "SUPER", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "SUPER", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "SUPER", action = act({ ActivateTab = 8 }) },

		{ key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },

		{ key = "&", mods = "LEADER|SHIFT", action = act({ CloseCurrentTab = { confirm = false } }) },
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = false } }) },

		{ key = "f", mods = "SHIFT|ALT", action = "ToggleFullScreen" },
	},
}

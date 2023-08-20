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

return {
	check_for_updates = false,
	-- color_scheme = "AdventureTime",
	-- color_scheme = "Solarized Dark Higher Contrast",
	-- color_scheme = "Paraiso Dark",
	color_scheme = "Peppermint",
	-- color_scheme = "Nocturnal Winter",
	-- color_scheme = "Galizur",
	-- color_scheme = "Guezwhoz",
	-- color_scheme = "Blue Matrix",
	-- color_scheme = "3024 Night",
	colors = {
		-- The color of the split lines between panes
		split = "#DDCCDD",
	},
	initial_cols = 195,
	initial_rows = 84,
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		"Hack Nerd Font Mono",
		"JetBrainsMono NF",
		"Fira Code",
	}),
	font_size = 13.0,
	enable_scroll_bar = false,
	scrollback_lines = 5000,
	front_end = "OpenGL",
	window_background_opacity = 0.95,
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
	-- default_cursor_style = "BlinkingBlock",
	-- cursor_blink_rate = 700,
	leader = { key = "a", mods = "CMD" },
	keys = {
		-- Disable some keys
		{ key = "Enter", mods = "ALT", action = "DisableDefaultAssignment" },
		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{
			key = "h",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }),
		},
		{
			key = "j",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }),
		},
		{
			key = "k",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }),
		},
		{
			key = "l",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }),
		},
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{
			key = "&",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{ key = "f", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
	},
}

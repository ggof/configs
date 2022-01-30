--  _               _ _ _
-- | |__   _____  _| (_) | _____
-- | '_ \ / _ \ \/ / | | |/ / _ \
-- | |_) | (_) >  <| | |   <  __/
-- |_.__/ \___/_/\_\_|_|_|\_\___|
--
-- A *box lookalike

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme_name = "eighties"
local theme = dofile(themes_path.."default/theme.lua")
--local theme = {}

local terminal_color_0 =  "#9da2a6"
local terminal_color_1 =  "#ff3333"
local terminal_color_2 =  "#bae67e"
local terminal_color_3 =  "#ffcc66"
local terminal_color_4 =  "#73d0ff"
local terminal_color_5 =  "#d4b0ff"
local terminal_color_6 =  "#83cec6"
local terminal_color_7 =  "#f0f0f0"
local terminal_color_8 =  "#d9dbdd"
local terminal_color_9 =  "#f51818"
local terminal_color_10 = "#c2d94c"
local terminal_color_11 = "#f29718"
local terminal_color_12 = "#59c2ff"
local terminal_color_13 = "#b77ee0"
local terminal_color_14 = "#5ccfe6"
local terminal_color_15 = "#ffffff"

local awful = require("awful")
-- Used to make it easier to align the panels in specific monitor positions
local screen_width = awful.screen.focused().geometry.width

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wall.jpg"
theme.font          = "VictorMono Nerd Font Mono 20"

local accent_color = terminal_color_14
local focused_color = terminal_color_14
local unfocused_color = terminal_color_7
local urgent_color = terminal_color_11

theme.bg_dark       = terminal_color_8
theme.bg_normal     = terminal_color_8
theme.bg_focus      = terminal_color_8
theme.bg_urgent     = terminal_color_8
theme.bg_minimize   = terminal_color_8
theme.bg_systray    = terminal_color_8

theme.fg_normal     = terminal_color_7
theme.fg_focus      = focused_color
theme.fg_urgent     = urgent_color
theme.fg_minimize   = terminal_color_8

theme.widget_fg = terminal_color_12
theme.widget_bg = terminal_color_15

-- Gaps
theme.useless_gap   = dpi(5)
-- This is used to manually determine how far away from the
-- screen edge the bars should be (if they are detached)
theme.screen_margin = dpi(5)

-- Borders
theme.border_width  = dpi(4)
theme.border_normal = terminal_color_7
theme.border_focus  = terminal_color_2
-- Rounded corners
theme.border_radius = dpi(6)

-- Titlebars
theme.titlebars_enabled = false
theme.titlebar_size = dpi(32)
theme.titlebar_title_enabled = false
theme.titlebar_font = theme.font -- BUG: Uses theme.font regardless
-- Window title alignment: left, right, center
theme.titlebar_title_align = "center"
-- Titlebar position: top, bottom, left, right
theme.titlebar_position = "top"
-- Use 4 titlebars around the window to imitate borders
theme.titlebars_imitate_borders = false
theme.titlebar_bg = terminal_color_7
-- theme.titlebar_bg_focus = terminal_color_5
-- theme.titlebar_bg_normal = terminal_color_13
theme.titlebar_fg_focus = terminal_color_7
theme.titlebar_fg_normal = terminal_color_15
--theme.titlebar_fg = terminal_color_7

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Values: bottom_left, bottom_right, bottom_middle,
--         top_left, top_right, top_middle
theme.notification_position = "top_right"
theme.notification_border_width = 0
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = terminal_color_10
theme.notification_bg = terminal_color_8
theme.notification_fg = terminal_color_15
theme.notification_crit_bg = urgent_color
theme.notification_crit_fg = terminal_color_0
theme.notification_margin = dpi(15)
theme.notification_icon_size = dpi(50)
--theme.notification_height = dpi(80)
--theme.notification_width = dpi(300)
--theme.notification_opacity = 0.7
theme.notification_font = theme.font
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 2

-- Edge snap
theme.snap_bg = theme.bg_focus
if theme.border_width == 0 then
    theme.snap_border_width = dpi(8)
else
    theme.snap_border_width = theme.border_width * 2
end

-- Tag names
local symb = " "
theme.tagnames = { symb, symb, symb, symb, symb, symb, symb, symb, symb, symb }

-- Widget separator
theme.separator_text = " | "
theme.separator_fg = terminal_color_15

-- Wibar
-- (The panel items can be customized in rc.lua)
theme.wibar_position = "top"
theme.wibar_detached = true
theme.wibar_height = dpi(48)
theme.wibar_fg = terminal_color_15
theme.wibar_bg = terminal_color_8
-- theme.wibar_opacity = 0.8
theme.wibar_border_color = terminal_color_8
theme.wibar_border_width = 0
theme.wibar_border_radius = theme.border_radius
--theme.wibar_width = screen_width - theme.screen_margin * 4 -theme.wibar_border_width * 2
theme.wibar_width = 4 * screen_width / 5
--theme.wibar_x = screen_width / 2 - theme.wibar_width - theme.screen_margin * 2
--theme.wibar_x = theme.screen_margin * 2
--theme.wibar_x = screen_width - theme.wibar_width - theme.wibar_border_width * 2 - theme.screen_margin * 2
--theme.wibar_y = theme.screen_margin * 2

-- Another wibar (optional)
theme.wibar_alt_enabled = false
--theme.wibar_alt_position = "bottom"
theme.wibar_alt_position = "left" --fake position so it does not increase screen margin
theme.wibar_alt_detached = false
theme.wibar_alt_height = dpi(48)
theme.wibar_alt_fg = terminal_color_15
theme.wibar_alt_bg = terminal_color_0
--theme.wibar_alt_opacity = 0.7
theme.wibar_alt_border_color = terminal_color_0
theme.wibar_alt_border_width = 0
theme.wibar_alt_border_radius = theme.border_radius
theme.wibar_alt_width = 420
theme.wibar_alt_x = screen_width / 2 + theme.screen_margin
--theme.wibar_alt_x = screen_width - theme.wibar_alt_width - theme.wibar_alt_border_width * 2 - theme.screen_margin * 2
theme.wibar_alt_y = theme.screen_margin * 2
--theme.wibar_alt_y = screen_height - theme.screen_margin * 2 - theme.wibar_alt_height - theme.wibar_alt_border_width * 2

-- Widgets
theme.prefix_fg = terminal_color_11

 --There are other variable sets
 --overriding the default one when
 --defined, the sets are:
 --taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
 --tasklist_[bg|fg]_[focus|urgent]
 --titlebar_[bg|fg]_[normal|focus]
 --tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
 --mouse_finder_[color|timeout|animate_timeout|radius|factor]
 --prompt_[fg|bg|fg_cursor|bg_cursor|font]
 --hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
 --Example:
--theme.taglist_bg_focus = "#ff0000"

 --Tasklist
theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = terminal_color_0 .. "00"
theme.tasklist_fg_focus = focused_color
theme.tasklist_bg_normal = terminal_color_0 .. "00"
theme.tasklist_fg_normal = unfocused_color
theme.tasklist_bg_minimize = terminal_color_0 .. "00"
theme.tasklist_fg_minimize = theme.fg_minimize
theme.tasklist_bg_urgent = terminal_color_0 .. "00"
theme.tasklist_fg_urgent = urgent_color
theme.tasklist_spacing = 5
theme.tasklist_align = "center"

-- Prompt
theme.prompt_fg = accent_color

-- Taglist
theme.taglist_font = theme.font
theme.taglist_bg_focus = terminal_color_0 .. "00"
theme.taglist_fg_focus = terminal_color_4
theme.taglist_bg_occupied = terminal_color_0 .. "00"
theme.taglist_fg_occupied = terminal_color_15
theme.taglist_bg_empty = terminal_color_0 .. "00"
theme.taglist_fg_empty = terminal_color_15
theme.taglist_bg_urgent = terminal_color_0 .. "00"
theme.taglist_fg_urgent = urgent_color
theme.taglist_disable_icon = true
theme.taglist_spacing = dpi(0)
--theme.taglist_item_roundness = 0
theme.taglist_item_roundness = theme.border_radius
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- "/usr/share/icons/Papirus/128x128/apps/arcolinux-hello.svg"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(200)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Recolor layout icons
--theme = theme_assets.recolor_layout(theme, terminal_color_1)

-- Desktop mode widget variables
-- Symbols     
theme.desktop_mode_color_floating = terminal_color_4
theme.desktop_mode_color_tile = terminal_color_4
theme.desktop_mode_color_max = terminal_color_3
theme.desktop_mode_text_floating = ""
theme.desktop_mode_text_tile = ""
theme.desktop_mode_text_max = ""
-- Minimal tasklist widget variables
theme.minimal_tasklist_visible_clients_color = focused_color
theme.minimal_tasklist_visible_clients_text = "  "
theme.minimal_tasklist_hidden_clients_color = terminal_color_4
theme.minimal_tasklist_hidden_clients_text = "  "


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

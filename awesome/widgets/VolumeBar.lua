-------------------------------------------------
-- Volume Bar Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumebar-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")

local request_command = 'amixer -D pulse sget Master'

local bar_color = beautiful.widget_fg
local mute_color = "#000000"
local background_color = beautiful.widget_bg

local volumebar_widget = wibox.widget {
    max_value = 1,
    forced_width = 50,
    paddings = 0,
    border_width = 2,
    color = bar_color,
    background_color = background_color,
    shape = gears.shape.rounded_bar,
    clip = true,
    margins       = {
        top = 10,
        bottom = 10,
    },
    widget = wibox.widget.progressbar
}

local update_graphic = function(widget, stdout, _, _, _)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    volume = tonumber(string.format("% 3d", volume))

    widget.value = volume / 100;
    widget.color = bar_color

    if mute == "off" then
        widget.color = mute_color

    end
end

volumebar_widget:connect_signal("button::press", function(_,_,_,button)
    if (button == 4)     then awful.spawn("amixer -D pulse sset Master 5%+", false)
    elseif (button == 5) then awful.spawn("amixer -D pulse sset Master 5%-", false)
    elseif (button == 1) then awful.spawn("amixer -D pulse sset Master toggle", false)
    end

    spawn.easy_async(request_command, function(stdout, stderr, exitreason, exitcode)
        update_graphic(volumebar_widget, stdout, stderr, exitreason, exitcode)
    end)
end)

watch(request_command, 1, update_graphic, volumebar_widget)

volumebar_prefix = wibox.widget.textbox(" ")
volumebar_prefix.markup = helpers.colorize_text(volumebar_prefix.text, beautiful.prefix_fg)
volumebar_widget.prefix = volumebar_prefix

return volumebar_widget
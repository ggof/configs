-- Clock widget for wibar

local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

clock_prefix = wibox.widget.textbox(" ")
clock_prefix.markup = helpers.colorize_text(clock_prefix.text, beautiful.prefix_fg)
text_clock = wibox.widget.textclock("%H:%M")

text_clock.prefix = clock_prefix

return text_clock
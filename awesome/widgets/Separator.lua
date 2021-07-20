--Separator widget for wibar

local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

text_separator = wibox.widget.textbox()
text_separator.text = beautiful.separator_text
text_separator.markup = helpers.colorize_text(text_separator.text, beautiful.separator_fg)

return text_separator
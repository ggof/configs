-------------------------------------------------
-- CPU Widget for Awesome Window Manager
-- Shows the current CPU utilization
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local watch = require("awful.widget.watch")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local cpugraph_widget = wibox.widget {
    max_value = 100,
    color = beautiful.widget_fg,
    background_color = beautiful.widget_bg,
    forced_width = 50,
    step_width = 5,
    step_spacing = 1,
    widget = wibox.widget.graph
}

-- mirrors and pushs up a bit
local cpu_widget = wibox.container.margin(wibox.container.mirror(cpugraph_widget, { horizontal = true }), 0, 0, 10, 10)

local total_prev = 0
local idle_prev = 0

watch([[bash -c "cat /proc/stat | grep '^cpu '"]], 1,
    function(widget, stdout, stderr, exitreason, exitcode)
        local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice =
        stdout:match('(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s')

        local total = user + nice + system + idle + iowait + irq + softirq + steal

        local diff_idle = idle - idle_prev
        local diff_total = total - total_prev
        local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

        widget:add_value(diff_usage)

        total_prev = total
        idle_prev = idle
    end,
    cpugraph_widget
)

cpu_prefix = wibox.widget.textbox(" ")
cpu_prefix.markup = helpers.colorize_text(cpu_prefix.text, beautiful.prefix_fg)
cpu_widget.prefix = cpu_prefix

return cpu_widget

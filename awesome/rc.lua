--                         ████
--                        ▒▒███
--   ████████   ██████     ▒███  █████ ████  ██████
--  ▒▒███▒▒███ ███▒▒███    ▒███ ▒▒███ ▒███  ▒▒▒▒▒███
--   ▒███ ▒▒▒ ▒███ ▒▒▒     ▒███  ▒███ ▒███   ███████
--   ▒███     ▒███  ███    ▒███  ▒███ ▒███  ███▒▒███
--   █████    ▒▒██████  ██ █████ ▒▒████████▒▒████████
--  ▒▒▒▒▒      ▒▒▒▒▒▒  ▒▒ ▒▒▒▒▒   ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒
--
--------------------------------------------------------------------------------
local fennel = require("./fennel")
fennel.path = fennel.path .. ";.config/awesome/?.fnl"
table.insert(package.loaders or package.searchers, fennel.searcher)

local theme_collection = {
    "eighties", -- 1 --
    "ayu",
    "cesious"
    --"whatever",     -- 2 --
    -- Add more themes here
}

-- Change this number to use a different theme
local theme_name = theme_collection[1]

--------------------------------------------------------------------------------

local gears = require("gears")
local awful = require("awful")

-- do this BEFORE loading bars and shit
awful.spawn.once(os.getenv("HOME") .. "/.config/awesome/autostart.sh")

-- Theme handling library
local beautiful = require("beautiful")
-- Themes define colours, icons, font and wallpapers.
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
beautiful.init(theme_dir .. theme_name .. "/theme.lua")
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Standard awesome library
require("bars")
require("awful.autofocus")
-- Default notification library
local naughty = require("naughty")
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Initialize stuff
local helpers = require("helpers")
local keys = require("keys")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify(
        {
            preset = naughty.config.presets.critical,
            title = "Oops, there were errors during startup!",
            text = awesome.startup_errors
        }
    )
end
-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function(err)
            -- Make sure we don't go into an endless error loop
            if in_error then
                return
            end
            in_error = true

            naughty.notify(
                {
                    preset = naughty.config.presets.critical,
                    title = "Oops, an error happened!",
                    text = tostring(err)
                }
            )
            in_error = false
        end
    )
end
-- }}}

-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
terminal = "kitty"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- I only ever use these
    awful.layout.suit.tile,
    awful.layout.suit.max
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}
-- }}}

-- TODO: some options are not respected when the notification is created
-- through lib-notify. Naughty works as expected.

-- Icon size
naughty.config.defaults["icon_size"] = beautiful.notification_icon_size

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 2
naughty.config.presets.critical.timeout = 12

-- Apply theme variables
naughty.config.padding = beautiful.notification_padding
naughty.config.spacing = beautiful.notification_spacing
naughty.config.defaults.margin = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width

naughty.config.presets.normal = {
    font = beautiful.font,
    fg = beautiful.notification_fg,
    bg = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin = beautiful.notification_margin,
    position = beautiful.notification_position
}

naughty.config.presets.low = {
    font = beautiful.font,
    fg = beautiful.notification_fg,
    bg = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin = beautiful.notification_margin,
    position = beautiful.notification_position
}

naughty.config.presets.ok = naughty.config.presets.low
naughty.config.presets.info = naughty.config.presets.low
naughty.config.presets.warn = naughty.config.presets.normal

naughty.config.presets.critical = {
    font = beautiful.font,
    fg = beautiful.notification_crit_fg,
    bg = beautiful.notification_crit_bg,
    border_width = beautiful.notification_border_width,
    margin = beautiful.notification_margin,
    position = beautiful.notification_position
}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tag Names
local tagnames = beautiful.tagnames or {"1", "2", "3", "4", "5", "6", "7", "8", "9"}

awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        set_wallpaper(s)

        -- Layouts
        -- Each screen has its own tag table.
        awful.tag(tagnames, s, awful.layout.layouts[1])
    end
)

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            screen = awful.screen.preferred,
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    -- Floating clients
    -- Skip taskbar
    {
        rule_any = {
            class = {}
        },
        properties = {},
        callback = function(c)
            c.skip_taskbar = true
        end
    },
    -- Needed only if option "-normal-window" is used
    {
        rule_any = {
            class = {
                "Rofi"
            }
        },
        properties = {floating = true, ontop = true, sticky = true},
        callback = function(c)
            c.skip_taskbar = true
            awful.placement.centered(c, {honor_workarea = true})
        end
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
    "manage",
    function(c)
        -- Set every new window as a slave,
        -- i.e. put it at the end of others instead of setting it master.
        if not awesome.startup then
            awful.client.setslave(c)
        elseif not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
            c.floating = false
        end

        -- Hide titlebars if required by the theme
        if not beautiful.titlebars_enabled then
            awful.titlebar.hide(c, beautiful.titlebar_position)
        end

        -- -- If the layout is not floating, every floating client that appears is centered
        -- if awful.layout.get(mouse.screen) ~= awful.layout.suit.floating then
        --     awful.placement.centered(c, {honor_workarea = true})
        -- end
    end
)

-- Rounded corners
if beautiful.border_radius ~= 0 then
    client.connect_signal(
        "manage",
        function(c, startup)
            if not c.fullscreen then
                c.shape = helpers.rrect(beautiful.border_radius)
            end
        end
    )

    -- Make sure fullscreen clients do not have rounded corners
    client.connect_signal(
        "property::fullscreen",
        function(c)
            if c.fullscreen then
                -- Use delayed_call in order to avoid flickering when corners
                -- change shape
                gears.timer.delayed_call(
                    function()
                        c.shape = helpers.rect()
                    end
                )
            else
                c.shape = helpers.rrect(beautiful.border_radius)
            end
        end
    )
end

-- When a client starts up in fullscreen, resize it to cover the fullscreen a short moment later
-- Enable sloppy focus, so that focus follows mouse.
--[[ client.connect_signal("mouse::enter", function(c)
    if awful.client.focus.filter(c) then
        client.focus = c
    end
end) ]]

-- Apply shapes
-- beautiful.notification_shape = helpers.infobubble(beautiful.notification_border_radius)
beautiful.notification_shape = helpers.rrect(beautiful.notification_border_radius)
beautiful.snap_shape = helpers.rrect(beautiful.border_radius * 2)
beautiful.taglist_shape = helpers.rrect(beautiful.taglist_item_roundness)

client.connect_signal(
    "focus",
    function(c)
        c.border_color = beautiful.border_focus
    end
)
client.connect_signal(
    "unfocus",
    function(c)
        c.border_color = beautiful.border_normal
    end
)


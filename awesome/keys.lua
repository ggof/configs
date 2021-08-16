local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")

local helpers = require("helpers")

local keys = {}

-- Mod keys
modkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

-- {{{ Key bindings
keys.globalkeys = gears.table.join(


    -- Focus client by index (cycle through clients)
    awful.key({ modkey }, "j",
        function () awful.client.focus.byidx(1) end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey }, "g",
        function () awful.tag.incgap(5, nil) end,
        {description = "increment gaps size for the current tag", group = "gaps"}
    ),
    awful.key({ modkey, shiftkey }, "g",
        function () awful.tag.incgap(-5, nil) end,
        {description = "decrement gap size for the current tag", group = "gaps"}
    ),
    -- Layout manipulation
    awful.key({ modkey, shiftkey   }, "j", function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move(  0,  40,   0,   0)
            helpers.move_to_edge(c, "down")
        else
            --awful.client.swap.byidx(  1)
            awful.client.swap.byidx(1)

        end
    end,
    {description = "swap with next", group = "client"}),
    awful.key({ modkey, shiftkey   }, "k", function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move(  0,  -40,   0,   0)
            helpers.move_to_edge(c, "up")
        else
            --awful.client.swap.byidx( -1)
            awful.client.swap.byidx(-1)
        end
    end,
    {description = "swap with previous", group = "client"}),
    -- Standard program
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, shiftkey }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey }, "h",     function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: resize client
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0, -20, 0)
        else
            awful.tag.incmwfact(-0.05)
        end
    end,
      {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, shiftkey }, "l",     function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: resize client
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  20, 0)
        else
            awful.tag.incmwfact( 0.05)
        end
    end,
      {description = "increase master width factor", group = "layout"}),
    -- change layouts
    awful.key({ modkey }, "space", function () awful.layout.inc(1) end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, shiftkey }, "space", function () awful.layout.inc(-1) end,
              {description = "select previous", group = "layout"}),

    -- Prompt
    awful.key({ modkey }, "p", function() awful.spawn.with_shell("rofi -show drun") end,
              {description = "rofi launcher", group = "launcher"}),

    -- Dismiss notifications
    awful.key( { ctrlkey }, "space", function()
        naughty.destroy_all_notifications()
    end,
              {description = "dismiss notification", group = "notifications"}),

    -- Volume Control
    awful.key( { }, "XF86AudioMute", function()
        awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
    end,
              {description = "(un)mute volume", group = "volume"}),
    awful.key( { }, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -5%")
    end,
              {description = "lower volume", group = "volume"}),
    awful.key( { }, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +5%")
    end,
              {description = "raise volume", group = "volume"}),
    -- Screenshots
    awful.key( { modkey }, "s", function() awful.spawn.with_shell("screenshot") end,
              {description = "select area to copy to clipboard", group = "screenshots"})
)

keys.clientkeys = gears.table.join(
    -- Move floating client (relative)
    awful.key({ modkey, shiftkey   }, "Down",   function (c) c:relative_move(  0,  40,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Up",     function (c) c:relative_move(  0, -40,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Left",   function (c) c:relative_move(-40,   0,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Right",  function (c) c:relative_move( 40,   0,   0,   0) end),
    -- Center client
    awful.key({ modkey }, "c",  function (c)
        awful.placement.centered(c,{honor_workarea=true})
        --awful.placement.centered(c,nil)
    end),
    -- Resize client
    awful.key({ modkey, ctrlkey }, "j",     function (c)
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  0, 20)
        else
            awful.client.incwfact(0.15)
        end
    end),
    awful.key({ modkey, ctrlkey }, "k",     function (c)
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  0, -20)
        else
            awful.client.incwfact(-0.15)
        end
    end),
    awful.key({ modkey, shiftkey, ctrlkey }, "j", function (c)
        -- Relative move
        c:relative_move(0,  20, 0, 0)
    end),
    awful.key({ modkey, shiftkey, ctrlkey }, "k", function (c)
        -- Relative move
        c:relative_move(0, -20, 0, 0)
    end),
    -- Toggle fullscreen
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    -- Minimize
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
local ntags = 10
for i = 1, ntags do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                            tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, shiftkey }, "#" .. i + 9,
                  function ()
                      if awful.client.focus then
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                              client.focus:tags({tag})
                          end
                     end
                  end,
        {description = "move focused client to tag #"..i, group = "tag"})
    )
end

-- Mouse buttons on the client (whole window, not just titlebar)
keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c then
            client.focus = c
        end
    end),

    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, function(c)
        awful.mouse.resize(c, nil, {jump_to_corner=true})
    end)
)
-- }}}

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.clientbuttons)
--root.buttons(keys.desktopbuttons)

return keys

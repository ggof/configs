; local awful = require("awful")
; local power_menu = require("widgets.PowerMenu")

; return awful.menu({items = power_menu})
(local (awful) (require "awful"))
(local (power_menu) (require "widgets.PowerMenu"))

(awful.menu {:items power_menu})

;free -h --si | awk '/^Mem/ {print $3 "/" $2}'
(local watch (require "awful.widget.watch"))
(local wibox (require "wibox"))
(local beautiful (require "beautiful"))
(local helpers (require "helpers"))

(local text (watch 
  "bash -c \"free -h --si | grep Mem\"" 
  1
  (fn [widget stdout]
    (local (total used) (string.match stdout "(%d+%.?%d*[GM])%s*(%d+%.?%d*[GM])"))
    (set widget.text (.. used "/" total))
    )))

(local ram_prefix (wibox.widget.textbox "力 "))
(set ram_prefix.markup (helpers.colorize_text ram_prefix.text beautiful.prefix_fg))
(set text.prefix ram_prefix)
text


(local awful (require "awful"))
(local spawn (require "awful.spawn"))
(local watch (require "awful.widget.watch"))
(local wibox (require "wibox"))
(local helpers (require "helpers"))
(local beautiful (require "beautiful"))
(local request_command "amixer -D pulse sget Master")

(let [volume_widget (wibox.widget.textbox)]
  (fn update_graphic [widget stdout _ _ _]
    (let [
          mute (string.match stdout "%[(o%D%D?)%]")
          volume (string.match stdout "(%d?%d?%d)%%")]
      (if 
        (= mute "off") (set widget.text "muted")
        (set widget.text (.. volume "%")))
      ))

  (fn on_button_press [_ _ _ button]
    (if
      (= button 4) (awful.spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%" false)
      (= button 5) (awful.spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%" false)
      (= button 1) (awful.spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" false))
    (spawn.easy_async request_command (fn [stdout _ _ _] (update_graphic volume_widget stdout))))

  (volume_widget:connect_signal "button::press" on_button_press)
  
  (watch request_command 1 update_graphic volume_widget)

  (let [prefix (wibox.widget.textbox " ")]
    (set prefix.markup (helpers.colorize_text prefix.text beautiful.prefix_fg))
    (set volume_widget.prefix prefix)

    volume_widget))

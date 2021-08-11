(let [
      widget (require "wibox.widget")
      beautiful (require "beautiful")
      helpers (require "helpers")]

  (let [clock_prefix (widget.textbox " ")]
    (set clock_prefix.markup (helpers.colorize_text clock_prefix.text beautiful.prefix_fg))
    (let [text_clock (widget.textclock "%H:%M")]
      (set text_clock.prefix clock_prefix)
      text_clock)))


(let [
      wibox (require "wibox")
      beautiful (require "beautiful")
      helpers (require "helpers")]

  (let [separator (wibox.widget.textbox)]
    (set separator.text beautiful.separator_text)
    (set separator.markup (helpers.colorize_text separator.text beautiful.taglist_fg_focus))
    
    separator))

(let [
      beautiful (require "beautiful")
      gears (require "gears")
      awful (require "awful")]

  (fn view_only [t] (t:view_only))
  (fn move_to_tag [t] (if client.focus (client.focus:move_to_tag t)))
  (fn toggle_tag [t] (if client.focus (client.focus:toggle_tag t)))
  (fn prev_screen [t] (awful.tag.viewprev t.screen))
  (fn next_screen [t] (awful.tag.viewnext t.screen))

  (fn [s] 
    (let [tag_buttons (gears.table.join 
                        (awful.button [] 1 view_only)
                        (awful.button [_G.modkey] 1 move_to_tag)
                        (awful.button [] 3 awful.tag.viewtoggle)
                        (awful.button [_G.modkey] 3 toggle_tag)
                        (awful.button [] 4 prev_screen)
                        (awful.button [] 5 next_screen))]

      (let [tag_list (awful.widget.taglist s awful.widget.taglist.filter.all tag_buttons)]
        (set tag_list.font beautiful.font)
        tag_list))))


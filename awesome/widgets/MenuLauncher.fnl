(let [
    awful (require "awful")
    beautiful (require "beautiful")
    main_menu (require "widgets.MainMenu")
  ]
  (awful.widget.launcher {:image (.. beautiful.icon_theme "/64x64/categories/distributor-logo-artix.svg") :menu main_menu}))

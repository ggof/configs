(local watch (require "awful.widget.watch"))
(local wibox (require "wibox"))
(local beautiful (require "beautiful"))
(local helpers (require "helpers"))
(local cpu_text (wibox.widget.textbox ""))


(fn do_watch [widget stdout stderr reason code]
  (var total_prev 0)
  (var idle_prev 0)
  (let [
        (user nice system idle iowait irq softirq steal) 
        (stdout:match "(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s")
        total (+ user nice system idle iowait irq softirq steal)
        diff_idle (- idle idle_prev)
        diff_total (- total total_prev)
        diff_usage (/ (+ 5 (/ (* 1000 (- diff_total diff_idle)) diff_total)) 10)]

    (set widget.text (.. (math.floor diff_usage) "%"))
    (set total_prev total)
    (set idle_prev idle)))

(watch 
  "bash -c \"cat /proc/stat | grep \"^cpu \"\"" 
  1
  do_watch
  cpu_text)

(local cpu_prefix (wibox.widget.textbox " "))
(set cpu_prefix.markup (helpers.colorize_text cpu_prefix.text beautiful.prefix_fg))
(set cpu_text.prefix cpu_prefix)
cpu_text

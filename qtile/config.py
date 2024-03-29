from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from functools import reduce, reversed
import os
import subprocess

C0 = "#2e3440"
C1 = "#bf616a"
C2 = "#a3be8c"
C3 = "#ebcb8b"
C4 = "#81a1c1"
C5 = "#b48ead"
C6 = "#88c0d0"
C7 = "#e5e9f0"

C8 = "#4c566a"
C9 = "#bf616a"
CA = "#a3be8c"
CB = "#ebcb8b"
CC = "#81a1c1"
CD = "#b48ead"
CE = "#88c0d0"
CF = "#8fbcbb"

fg = "#e5e9f0"
bg = "#2e3440"


def prefix(text):
    return widget.TextBox(text=text, foreground=CA)


def spacer():
    return widget.Spacer(background=CB, length=2)


mod = "mod4"
alt = "mod1"
terminal = "kitty"
wallpaper = os.path.expanduser(
    '~/.local/share/backgrounds/firewatch-dark-version-wallpaper.jpg')


@hook.subscribe.startup_once
def autostart():
    startup = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([startup])


keys = [
    # Switch between windows
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([alt], "Escape", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod], "l", lazy.layout.grow_main(),
        desc="Grow main stack"),
    Key([mod], "h", lazy.layout.shrink_main(),
        desc="Shrink main stack"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "t", lazy.window.toggle_floating(),
        desc="Toggle between floating and tiled"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn("rofi -show drun"), desc="show rofi"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"))
]


for i in map(Group, "123456789"):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(toggle=False),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.MonadTall(
        border_focus=CC,
        border_width=4,
        margin=4,
        single_margin=4,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font='Iosevka Nerd Font Mono Medium',
    fontsize=24,
    foreground=fg,
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper=wallpaper,
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    this_current_screen_border=CC,
                    inactive=fg,
                ),
                spacer(),
                widget.CurrentLayout(),
                spacer(),
                widget.WindowName(),
                widget.Systray(margin=8),
                spacer(),
                prefix(""),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "ca"],
                ),
                spacer(),
                prefix(""),
                widget.CPU(
                    format="{freq_current}GHz {load_percent}%"
                ),
                spacer(),
                prefix(""),
                widget.Memory(
                    # format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}"
                ),
                spacer(),
                prefix(""),
                widget.Volume(),
                spacer(),
                prefix(""),
                widget.Clock(
                    format='%Y-%m-%d %I:%M %p',
                ),
                spacer(),
                prefix(""),
                widget.QuickExit(default_text="exit", countdown_format="{}"),
                widget.Spacer(length=2),
            ],
            48,
            background=bg,
            margin=4,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(wm_class='pinentry-gtk-2'),  # GPG key password entry
    Match(wm_class='pinentry')
])

auto_fullscreen = True
focus_on_window_activation = "smart"
follow_mouse_focus = False

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

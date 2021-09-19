# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os
import subprocess

C0 = "#4c4c4c"
C1 = "#ac8a8c"
C2 = "#8aac8b"
C3 = "#aca98a"
C4 = "#8f8aac"
C5 = "#ac8aac"
C6 = "#8aacab"
C7 = "#f0f0f0"
C8 = "#262626"
C9 = "#c49ea0"
CA = "#9ec49f"
CB = "#c4c19e"
CC = "#a39ec4"
CD = "#c49ec4"
CE = "#9ec3c4"
CF = "#e7e7e7"

def prefix(text):
    return widget.TextBox(text=text, foreground=CB)


mod = "mod4"
alt = "mod1"
terminal = "kitty"
wallpaper = os.path.expanduser('~/.local/share/backgrounds/16949.jpg')


@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([autostart])


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
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn("rofi -show drun"), desc="show rofi"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"))
]

groups = [Group(i) for i in "123456789"]

for i in groups:
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
        border_focus=C2,
        border_width=4,
        margin=8,
        single_margin=8,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='VictorMono Nerd Font Mono Medium',
    fontsize=22,
    foreground=C7,
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
                    this_current_screen_border=C4,
                    inactive=CF,
                ),
                widget.Spacer(background=C4, length=2),
                widget.CurrentLayout(),
                widget.Spacer(background=C4, length=2),
                widget.WindowName(
                    foreground=CF,
                ),
                widget.Systray(margin=8),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "ca"],
                ),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.CPU(
                    format="{freq_current}GHz {load_percent}%"
                ),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.Memory(
                    # format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}"
                ),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.Volume(),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.Clock(
                    format='%Y-%m-%d %I:%M %p',
                ),
                widget.Spacer(background=C4, length=2),
                prefix(""),
                widget.QuickExit(default_text="exit", countdown_format="{}"),
                widget.Spacer(length=2),
            ],
            40,
            background=C0,
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
dgroups_app_rules = []  # type: List
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
    Match(title='pinentry'),  # GPG key password entry
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

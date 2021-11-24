set -gx FZF_DEFAULT_COMMAND fd --type f
set -gx NIMBIN $HOME/.nimble/bin
set -gx POETRYBIN $HOME/.poetry/bin
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx DARTBIN $HOME/.pub_cache/bin
set -gx FLUTTERBIN $HOME/.local/share/flutter/bin
set -gx ANDROIDBIN $HOME/Android/Sdk/platform-tools
set -gx ANDROIDBIN $ANDROIDBIN $HOME/Android/Sdk/emulator
set -gx LOCALBIN $HOME/.local/bin
set -gx CARGOBIN $HOME/.cargo/bin
set -gx PONYBIN $HOME/.local/share/ponyup/bin

set -gx PATH $PATH $GOBIN $DARTBIN $FLUTTERBIN $ANDROIDBIN $LOCALBIN $CARGOBIN $POETRYBIN $NIMBIN $PONYBIN

set -gx EDITOR nvim

## COLORS ##

# Chalk Color Palette
set -u foreground eeffff
set -u selection 303030
set -u comment 4a4a4a
set -u red ff5370
set -u green c3e88d
set -u orange f78c6c
set -u yellow ffcb6b
set -u blue 82aaff
set -u magenta c792ea
set -u cyan 89ddff

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $blue
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $magenta
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

alias pyright-langserver pyright

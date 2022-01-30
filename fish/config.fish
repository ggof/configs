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

set -gx PATH $PATH $GOBIN $DARTBIN $FLUTTERBIN $ANDROIDBIN $LOCALBIN $CARGOBIN $POETRYBIN $NIMBIN

set -gx EDITOR nvim
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
#pfetch
alias tf terraform

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
set -gx ROSBIN $HOME/.roswell/bin
set -gx JAVA_HOME /lib/jvm/default
set -gx JAVA_BIN $JAVA_HOME/bin
set -gx TURSO_HOME $HOME/.turso
set -gx DOTNETBIN $HOME/.dotnet/tools
set -gx CARGOBIN $HOME/.cargo/bin
set -gx DART_SDK_PATH $HOME/.local/share/dart-sdk
set -gx ONYX_PATH $HOME/.local/share/onyx
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -gx BUN_INSTALL $HOME/.bun

fish_add_path $CARGOBIN $DART_SDK_PATH/bin $ONYX_PATH/bin $HOME/.dune/bin $GOBIN $DARTBIN $FLUTTERBIN $ANDROIDBIN $LOCALBIN $CARGOBIN $POETRYBIN $NIMBIN $ROSBIN $JAVA_BIN $TURSO_HOME $DOTNETBIN $PNPM_HOME $BUN_INSTALL/bin

set -gx EDITOR nvim
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx SSL_CERT_DIR /etc/ssl/certs

#pfetch
alias tf terraform

# bun

# dune
source $HOME/.dune/env/env.fish

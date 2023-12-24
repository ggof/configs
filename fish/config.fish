set -gx GOPATH $HOME/go
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

# OCaml
set -gx OPAM_SWITCH_PREFIX $HOME/.opam/default
set -gx CAML_LD_LIBRARY_PATH $OPAM_SWITCH_PREFIX/lib/stublibs /usr/lib/ocaml/stublibs /usr/lib/ocaml
set -gx OCAML_TOPLEVEL_PATH $OPAM_SWITCH_PREFIX/lib/toplevel

set -gx OPAM_BIN $OPAM_SWITCH_PREFIX/bin

# builtin -n | /bin/sh -c 'grep -q \'^argparse$\'' 1>/dev/null 2>/dev/null; and set -gx MANPATH ':/home/gabrielg/.opam/default/man';

set -gx PATH $PATH $OPAM_BIN $GOBIN $DARTBIN $FLUTTERBIN $ANDROIDBIN $LOCALBIN $CARGOBIN $POETRYBIN $NIMBIN $ROSBIN $JAVA_BIN $TURSO_HOME $DOTNETBIN

set -gx EDITOR nvim
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

#pfetch
alias tf terraform

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

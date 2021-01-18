set -gx FZF_DEFAULT_COMMAND 'rg --files -g "!{node_modules/*,.git/*}"'
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx DARTBIN $HOME/.pub_cache/bin
set -gx FLUTTERBIN $HOME/.local/share/flutter/bin
set -gx ANDROIDBIN $HOME/Android/Sdk/platform-tools
set -gx ANDROIDBIN $ANDROIDBIN $HOME/Android/Sdk/emulator
set -gx LOCALBIN $HOME/.local/bin
set -gx DOOM_BIN $HOME/.emacs.d/bin/doom 

set -gx PATH $PATH $GOBIN $DARTBIN $FLUTTERBIN $ANDROIDBIN $LOCALBIN $DOOM_BIN

set -gx EDITOR nvim

## COLORS ##
# Dracula Color Palette
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

## FISH PROMPT ##
# name: mars (based on eclm)
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow " $green▶︎︎"
  else
      set arrow " $red▶︎︎"
  end
  set -l cwd $cyan(prompt_pwd)

  if [ (_git_branch_name) ]
    set git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      set git_info "$blue ($yellow$git_branch±$blue)"
    else
      if test (_git_branch_name) = 'master'
        set git_info "$blue ($red$git_branch$blue)"
      else
        set git_info "$blue ($normal$git_branch$blue)"
      end
    end
  end

  echo -n -s $cwd $git_info $normal $arrow $normal ' '
end

function ex --description "Expand or extract bundled & compressed files"
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case tar  # non-compressed, just bundled
      tar -xvf $argv[1]
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar  # tar bundle compressed with gzip
        tar -zxvf $argv[1]
      else  # single gzip
        gunzip $argv[1]
      end
    case tgz  # same as tar.gz
      tar -zxvf $argv[1]
    case bz2  # tar compressed with bzip2
      tar -jxvf $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1]
    case '*'
      echo "unknown extension"
  end
end

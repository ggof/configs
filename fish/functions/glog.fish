function glog --description "alias for git log with a bunch of parameters"
    git log --oneline --graph --color --decorate --all $argv
end

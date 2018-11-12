set -x EDITOR emacs

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

rbenv init - | source

set -x PATH $HOME/.nodebrew/current/bin $PATH

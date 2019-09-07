set -x EDITOR emacs

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

rbenv init - | source

set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
set -x PATH /usr/local/opt/mysql@5.6/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kymmt90/google-cloud-sdk/path.fish.inc' ]; . '/Users/kymmt90/google-cloud-sdk/path.fish.inc'; end

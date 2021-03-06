set -x EDITOR vi

ulimit -n 1024

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

rbenv init - | source

set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
set -x PATH /usr/local/opt/mysql@5.6/bin $PATH
set -x PATH /usr/local/opt/openssl@1.1/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x NODE_PATH $HOME/.nodebrew/current/lib/node_modules $NODE_PATH
set -x PATH $HOME/go/bin $PATH

eval (ssh-agent -c) >/dev/null

function on_exit --on-event fish_exit
  ssh-agent -k >/dev/null
end

set -x GPG_TTY (tty)
set -x GPG_AGENT_INFO $HOME/.gnupg/S.gpg-agent:0:1
if [ ! (pgrep -x -u $USER "gpg-agent" | head -1) ]
  set -el DISPLAY
  gpg-connect-agent /bye
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kymmt90/google-cloud-sdk/path.fish.inc' ]; . '/Users/kymmt90/google-cloud-sdk/path.fish.inc'; end

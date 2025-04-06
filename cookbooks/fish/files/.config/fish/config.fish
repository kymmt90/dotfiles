set -x EDITOR vi

ulimit -n 1024

set ARCH (uname -m)

if [ $ARCH = "arm64" ]
 eval (/opt/homebrew/bin/brew shellenv)
end

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

rbenv init - | source

set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $HOME/go/bin $PATH

set -x PATH (brew --prefix)/share/git-core/contrib/diff-highlight $PATH
set -x PATH (brew --prefix)/opt/mysql@5.6/bin $PATH
set -x PATH (brew --prefix)/opt/openjdk/bin $PATH
set -x PATH (brew --prefix)/opt/openssl@1.1/bin $PATH
set -x PATH (brew --prefix)/opt/diffutils/bin $PATH
set -x PATH (brew --prefix)/opt/postgresql@17/bin $PATH

set -x LIBRARY_PATH (brew --prefix)/lib $LIBRARY_PATH

set -x GPG_TTY (tty)
set -x GPG_AGENT_INFO $HOME/.gnupg/S.gpg-agent:0:1
if [ ! (pgrep -x -u $USER "gpg-agent" | head -1) ]
  set -el DISPLAY
  gpg-connect-agent /bye
end

source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"

direnv hook fish | source

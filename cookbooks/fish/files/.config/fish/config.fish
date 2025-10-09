set -x EDITOR vi

ulimit -n 1024

eval (/opt/homebrew/bin/brew shellenv)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

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

set -x BYOBU_CONFIG_DIR $HOME/.config/byobu

set -x GPG_TTY (tty)
set -x GPG_AGENT_INFO $HOME/.gnupg/S.gpg-agent:0:1
if [ ! (pgrep -x -u $USER "gpg-agent" | head -1) ]
  set -el DISPLAY
  gpg-connect-agent /bye
end

set -x PNPM_HOME $HOME/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
  set -x PATH "$PNPM_HOME" $PATH
end

set -x PSQLRC $HOME/.config/pg/psqlrc

set -x RIPGREP_CONFIG_PATH $HOME/.config/rg/config

if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc" ]
  source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
end

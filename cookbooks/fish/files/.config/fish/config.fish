set -x LANG C
set -x EDITOR vi

ulimit -n 1024

eval (/opt/homebrew/bin/brew shellenv)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight
fish_add_path $HOMEBREW_PREFIX/opt/mysql@5.6/bin
fish_add_path $HOMEBREW_PREFIX/opt/openjdk/bin
fish_add_path $HOMEBREW_PREFIX/opt/openssl@1.1/bin
fish_add_path $HOMEBREW_PREFIX/opt/diffutils/bin
fish_add_path $HOMEBREW_PREFIX/opt/postgresql@17/bin

set -x LIBRARY_PATH $HOMEBREW_PREFIX/lib $LIBRARY_PATH

set -x BYOBU_CONFIG_DIR $HOME/.config/byobu

set -x GPG_TTY (tty)
set -x GPG_AGENT_INFO $HOME/.gnupg/S.gpg-agent:0:1
if [ ! (pgrep -x -u $USER "gpg-agent" | head -1) ]
  set -el DISPLAY
  gpg-connect-agent /bye
end

set -x HOMEBREW_NO_ENV_HINTS 1

set -x LESS -FR

set -x PNPM_HOME $HOME/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
  set -x PATH "$PNPM_HOME" $PATH
end

set -x PSQLRC $HOME/.config/pg/psqlrc

set -x RIPGREP_CONFIG_PATH $HOME/.config/rg/config

if [ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.fish.inc" ]
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.fish.inc"
end

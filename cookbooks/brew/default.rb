execute 'brew installation' do
  command <<~CMD
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  CMD
  not_if 'type brew >/dev/null 2>&1'
end

BREWFILE = File.join(File.dirname(__FILE__), 'Brewfile')
execute "brew bundle install --file #{BREWFILE} --no-upgrade -q" do
  # only if not all installed
  not_if "brew bundle check --file #{BREWFILE} --no-upgrade -q >/dev/null 2>&1"
end

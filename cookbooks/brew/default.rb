execute 'brew installation' do
  command <<~CMD
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  CMD
  not_if 'type brew >/dev/null 2>&1'
end

brewfile = File.join(File.dirname(__FILE__), 'Brewfile')
execute "brew bundle install --file #{brewfile} --no-upgrade -q" do
  # only if not all installed
  not_if "brew bundle check --file #{brewfile} --no-upgrade -q >/dev/null 2>&1"
end

if node.has_install_scope?(:additional)
  additional_brewfile = File.join(File.dirname(__FILE__), 'additional.Brewfile')
  execute "brew bundle install --file #{additional_brewfile} --no-upgrade -q" do
    # only if not all installed
    not_if <<~COND
      brew bundle check --file #{additional_brewfile} --no-upgrade -q >/dev/null 2>&1
    COND
  end
end

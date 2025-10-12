package 'colima'
package "docker"
package "docker-compose"
package "docker-credential-helper"

directory File.join(ENV['HOME'], '.docker') do
  mode '755'
end

config_path = File.join(ENV['HOME'], '.docker', 'config.json')

execute 'configure credsStore' do
  tmp_path = '/tmp/docker-config.json'

  command <<~CMD
    cat #{config_path} | jq '.credsStore = "osxkeychain"' > #{tmp_path} && mv #{tmp_path} #{config_path}
  CMD

  not_if %(cat #{config_path} | jq -e '.credsStore == "osxkeychain"')
end

execute "configure cliPluginsExtraDirs" do
  config = <<~CONFIG
    {"cliPluginsExtraDirs":["#{`brew --prefix`.strip}/lib/docker/cli-plugins"]}
  CONFIG
  tmp_path = "/tmp/docker-config.json"

  command <<~COMMAND
    cat #{config_path} | jq '. + #{config}' > #{tmp_path} && mv #{tmp_path} #{config_path}
  COMMAND
  not_if "grep -q cliPluginsExtraDirs #{config_path}"
end

execute "brew services start colima" do
  # only if colima has not already started
  only_if <<~COND
    brew services --json | \
    jq -e 'map(select(.name == "colima" and .status != "started")) | any' >/dev/null
  COND
end

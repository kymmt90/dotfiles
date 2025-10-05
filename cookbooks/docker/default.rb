package 'colima'
package "docker"
package "docker-compose"
package "docker-credential-helper"

directory File.join(ENV['HOME'], '.docker') do
  mode '755'
end

execute "configure cliPluginsExtraDirs" do
  config_path = File.join(ENV['HOME'], '.docker', 'config.json')
  config = <<~CONFIG
    {"cliPluginsExtraDirs":["#{`brew --prefix`.strip}/lib/docker/cli-plugins"]}
  CONFIG
  tmp_path = "/tmp/docker-config.json"

  command <<~COMMAND
    cat #{config_path} | jq '. + #{config}' > #{tmp_path} && mv #{tmp_path} #{config_path}
  COMMAND
  not_if "grep -q cliPluginsExtraDirs #{config_path}"
end

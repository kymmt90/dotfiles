package 'colima'
package 'docker'
package 'docker-compose'
package 'docker-credential-helper'

docker_config_directory_path = File.join(ENV['HOME'], '.docker')
docker_config_path = File.join(docker_config_directory_path, 'config.json')

config_directory docker_config_directory_path do
  xdg false
end

execute 'credsStore configuration' do
  tmp_path = '/tmp/docker-config.json'

  command <<~CMD
    cat #{docker_config_path} | \
    jq '.credsStore = "osxkeychain"' > #{tmp_path} && mv #{tmp_path} #{docker_config_path}
  CMD

  not_if %(cat #{docker_config_path} | jq -e '.credsStore == "osxkeychain"')
end

execute 'cliPluginsExtraDirs configuration' do
  config = <<~CFG
    {"cliPluginsExtraDirs":["#{`brew --prefix`.strip}/lib/docker/cli-plugins"]}
  CFG
  tmp_path = '/tmp/docker-config.json'

  command <<~CMD
    cat #{docker_config_path} | jq '. + #{config}' > #{tmp_path} && mv #{tmp_path} #{docker_config_path}
  CMD

  not_if "grep -q cliPluginsExtraDirs #{docker_config_path}"
end

execute 'brew services start colima' do
  only_if <<~COND
    brew services --json | \
    jq -e 'map(select(.name == "colima" and .status != "started")) | any' >/dev/null
  COND
end

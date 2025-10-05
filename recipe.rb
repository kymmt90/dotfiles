XDG_CONFIG_HOME = File.join(ENV['HOME'], '.config')

define :config, xdg: true do
  directories = File.dirname(params[:name])
  directories = File.join(XDG_CONFIG_HOME, directories) if params[:xdg]
  directory directories do
    user node[:user]
  end

  config_src = params[:name]
  config_src = File.join(File.basename(XDG_CONFIG_HOME), config_src) if params[:xdg]
  config_src = File.join('cookbooks', File.basename(directories), 'files', config_src)
  link File.join(XDG_CONFIG_HOME, params[:name]) do
    to File.expand_path(config_src)
    user node[:user]
    force true
  end
end

include_recipe 'cookbooks/brew'

include_recipe 'cookbooks/fish'

%w(
  bat
  byobu
  docker
  ghq
  git
  mise
  pg
  rg
).each do |tool|
  include_recipe "cookbooks/#{tool}"
end

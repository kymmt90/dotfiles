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

include_recipe 'cookbooks/byobu'
include_recipe 'cookbooks/docker'
include_recipe 'cookbooks/ghq'
include_recipe 'cookbooks/git'
include_recipe 'cookbooks/mise'
include_recipe 'cookbooks/pg'
include_recipe 'cookbooks/rg'

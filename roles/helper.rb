node.validate! do
  {
    install_scope: array_of(symbol)
  }
end

# @rbs (:essential | :additional) -> bool
def node.has_install_scope?(scope)
  self[:install_scope].include?(scope)
end

XDG_CONFIG_HOME = File.join(ENV['HOME'], '.config')

define :config_directory, xdg: true do
  directories = params[:name]
  directories = File.join(XDG_CONFIG_HOME, directories) if params[:xdg]
  directory directories do
    user node[:user]
  end
end

define :config, xdg: true do
  directories = File.dirname(params[:name])
  xdg = params[:xdg]
  config_directory directories do
    xdg xdg
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

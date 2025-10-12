node.reverse_merge!({
  os_version: `sw_vers -productVersion`.chomp
})

node.validate! do
  {
    install_scope: array_of(symbol),
    os_version: string
  }
end

# @rbs (:essential | :additional) -> bool
def node.has_install_scope?(scope)
  self[:install_scope].include?(scope)
end

XDG_CONFIG_HOME = File.join(ENV["HOME"], ".config")

define :config_directory, xdg: true do
  directories = params[:name]
  next if directories == "."

  directories = File.join(XDG_CONFIG_HOME, directories) if params[:xdg]
  directory directories do
    user node[:user]
  end
end

define :config, tool: nil, xdg: true do
  directories = File.dirname(params[:name])
  xdg = params[:xdg]
  config_directory directories do
    xdg xdg
  end

  config_src = params[:name]
  config_src = File.join(File.basename(XDG_CONFIG_HOME), config_src) if params[:xdg]
  config_src = File.join(
    "cookbooks",
    params[:tool] || File.basename(directories),
    "files",
    config_src
  )

  link_path = if params[:xdg]
    File.join(XDG_CONFIG_HOME, params[:name])
  else
    File.join(ENV["HOME"], params[:name])
  end
  link link_path do
    to File.expand_path(config_src)
    user node[:user]
    force true
  end
end

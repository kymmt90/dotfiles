BREW_PREFIX = `brew --prefix`.strip

define :link_dotfile, cookbook: nil do
  target = File.join(ENV['HOME'], params[:name])

  link target do
    to File.expand_path("./cookbooks/#{params[:cookbook]}/files/#{params[:name]}")
    force true
  end
end

include_recipe 'cookbooks/docker'
include_recipe 'cookbooks/fish'
include_recipe 'cookbooks/ghq'
include_recipe 'cookbooks/git'
include_recipe 'cookbooks/mise'
include_recipe 'cookbooks/psql'

define :link_dotfile, cookbook: nil do
  target = File.join(ENV['HOME'], params[:name])

  link target do
    to File.expand_path("./cookbooks/#{params[:cookbook]}/files/#{params[:name]}")
    force true
  end
end

include_recipe 'cookbooks/git/default.rb'
include_recipe 'cookbooks/fish/default.rb'
include_recipe 'cookbooks/psql/default.rb'
include_recipe 'cookbooks/mise/default.rb'

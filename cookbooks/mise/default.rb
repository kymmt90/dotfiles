directory File.join(ENV['HOME'], '.config/mise') do
  mode '700'
end

link_dotfile '.config/mise/config.toml' do
  cookbook 'mise'
end

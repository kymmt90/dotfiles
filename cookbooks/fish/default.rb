directory File.join(ENV['HOME'], '.config/fish') do
  mode '700'
end

link_dotfile '.config/fish/config.fish' do
  cookbook 'fish'
end

link_dotfile '.config/fish/functions' do
  cookbook 'fish'
end

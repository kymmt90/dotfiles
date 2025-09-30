directory File.join(ENV['HOME'], '.config/rg') do
  mode '700'
end


link_dotfile '.config/rg/config' do
  cookbook 'rg'
end

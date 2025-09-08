link_dotfile '.gitconfig' do
  cookbook 'git'
end

link_dotfile '.config/git/ignore' do
  cookbook 'git'
end

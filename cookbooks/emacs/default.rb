emacs_dir = File.join(ENV['HOME'], '.emacs.d')

directory emacs_dir do
  mode '700'
end

link_dotfile '.emacs.d/init.el' do
  cookbook 'emacs'
end

link_dotfile '.emacs.d/Cask' do
  cookbook 'emacs'
end

execute 'Install Emacs packages by Cask' do
  cwd emacs_dir
  command 'cask install'
end

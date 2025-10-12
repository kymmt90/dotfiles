package 'ghostty' do
  not_if "ls #{`brew --prefix`.strip}/Caskroom/ghostty"
end

config '/ghostty/config'

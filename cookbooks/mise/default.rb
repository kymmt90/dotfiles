package 'mise'

config '/mise/config.toml'

# https://mise.jdx.dev/lang/ruby.html#default-gems
config '.default-gems' do
  tool 'mise'
  xdg false
end

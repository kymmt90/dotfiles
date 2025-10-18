include_recipe "helper"

include_recipe "../cookbooks/brew"
include_recipe "../cookbooks/fish"

%w[
  bat
  byobu
  docker
  fd
  ghostty
  git
  mise
  pg
  rg
].each do |tool|
  include_recipe "../cookbooks/#{tool}"
end

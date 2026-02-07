include_recipe "helper"

include_recipe "../cookbooks/brew"
include_recipe "../cookbooks/fish"

tools = %w[
  bat
  byobu
  claude
  container
  docker
  fd
  ghostty
  git
  mise
  pg
  rg
]

additional_tools = %w[
  opam
]

tools_to_be_installed = if node.has_install_scope?(:additional)
  tools + additional_tools
else
  tools
end
tools_to_be_installed.each do |tool|
  include_recipe "../cookbooks/#{tool}"
end

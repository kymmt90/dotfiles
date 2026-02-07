package "claude-code" do
  not_if "ls #{`brew --prefix`.strip}/Caskroom/claude-code"
end

config ".claude/settings.json" do
  xdg false
end

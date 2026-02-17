source_path = "/Applications/CotEditor.app/Contents/SharedSupport/bin/cot"
link File.join(XDG_LOCAL_BIN, "cot") do
  to source_path
  force true
  only_if "test -f #{source_path}"
end

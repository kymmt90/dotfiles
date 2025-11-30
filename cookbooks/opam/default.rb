opam_config_directory_path = File.join(ENV["HOME"], ".opam")
config_directory opam_config_directory_path do
  xdg false
end

package "opam"

# utop key bindings
# cf. https://discuss.ocaml.org/t/default-key-bindings-for-utop/3950
config ".lambda-term-inputrc" do
  tool "opam"
end

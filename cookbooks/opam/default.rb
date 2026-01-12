opam_config_directory_path = File.join(ENV["HOME"], ".opam")
config_directory opam_config_directory_path do
  xdg false
end

package "opam"

execute "opam init -y" do
  not_if "test -d #{opam_config_directory_path}/opam-init"
end

packages = %w[
  ocaml-lsp-server
  ocamlformat
  odoc
  utop
].join(" ")
execute "opam install --switch default -y #{packages}" do
  not_if "opam install --switch default --check #{packages} >/dev/null 2>&1"
end

# utop key bindings
# cf. https://discuss.ocaml.org/t/default-key-bindings-for-utop/3950
config ".lambda-term-inputrc" do
  tool "opam"
end

config ".ocamlformat" do
  tool "opam"
  xdg false # because ocaml-lsp-server formatting doesn't respect XDG
end

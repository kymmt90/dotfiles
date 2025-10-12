os_major_version = node[:os_version].split(".").first.to_i
if os_major_version >= 26
  package "container"

  execute "container system start --enable-kernel-install" do
    # unless started
    not_if "container system status >/dev/null 2>&1"
  end
end

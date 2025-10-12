package 'container'

execute 'container system start --enable-kernel-install' do
  # unless started
  not_if 'container system status >/dev/null 2>&1'
end

package "git"
package "ghq"

config "/git/config"
config "/git/ignore"

directory File.join(ENV["HOME"], "Repositories")

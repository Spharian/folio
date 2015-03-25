set :application, "folio"
set :deploy_user, "deployer"

# Repo details
set :repo_url, "git@github.com:Spharian/folio.git"

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml")

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system")

# Which config files should be copied by deploy:setup_config
set(:config_files, %w(
  nginx.conf
  database.example.yml
  unicorn.rb
  unicorn_init.sh
))

# Which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# Files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts,
# init scripts etc. The full_app_name variable isn't
# available at this point so we use a custom template {{}}
# tag and then add it at run time.
set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
  }
])

namespace :deploy do
  # Remove the default nginx configuration as it will tend
  # to conflict with our configs.
  before :starting, "deploy:setup_config", "nginx:remove_default_vhost"

  # Reload nginx to it will pick up any modified vhosts from
  # setup_config
  after :finished, "deploy:setup_config", "nginx:reload"
end

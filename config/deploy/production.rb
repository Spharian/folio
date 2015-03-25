# This is used in the Nginx VirtualHost to specify which domains
# the app should appear on. If you don't yet have DNS setup, you'll
# need to create entries in your local Hosts file for testing.
set :server_name, "www.ketfikevin.ddns.net ketfikevin.ddns.net"

server "92.222.14.113", user: "#{fetch(:deploy_user)}", roles: %w{app web db}

set :deploy_to, "/var/www/#{fetch(:application)}"

set :rails_env, :production

# Number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 2

# Whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false

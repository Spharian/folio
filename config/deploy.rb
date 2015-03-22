# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'folio'
set :repo_url, 'git@github.com:Spharian/folio.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/var/www/#{fetch(:application)}"
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do
  desc "Create unicorn init symlink"
  task :unicorn_init_symlink do
    on roles(:app) do
      # Make unicorn_init.sh executable
      execute "chmod +x /var/www/#{fetch(:application)}/current/config/unicorn_init.sh"
      # Create the symlink
      execute "ln -s -f /var/www/#{fetch(:application)}/current/config/unicorn_init.sh /etc/init.d/unicorn-#{fetch(:application)}"
    end
  end

  after :finished, 'deploy:nginx_symlink'
  after :finished, 'deploy:unicorn_init_symlink'
end

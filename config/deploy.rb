# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'folio'
set :pty, true
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

  # Custom tasks
  desc "Create nginx nginx symlink"
  task :nginx_symlink do
    on roles(:app) do
      execute :sudo, "ln -s /var/www/#{fetch(:application)}/current/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
    end
  end
  
  # after :finished do
  #   execute "sudo ln -s /var/www/#{fetch(:application)}/current/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
  # end

  after :finished, 'deploy:nginx_symlink'
  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     within release_path do
  #       execute :rake, 'cache:clear'
  #       execute "service thin restart"
  #     end
  #   end
  # end
end

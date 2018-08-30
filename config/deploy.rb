# config valid only for current version of Capistrano
lock '3.4.1'

set :repo_url, 'https://github.com/lyminhtanh/lieu.git'
application = "lieuvn"
set :application, "#{application}"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/spree/#{application}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key')

# Default value for linked_dirs is []
 set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system','public/uploads')
# set :linked_files, "config/database.yml", "config/master.key"
# # set :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :seed do
    on primary fetch(:migration_role) do
      within current_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  task :create_admin do
    on primary fetch(:migration_role) do
      within current_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'spree_auth:admin:create'
          # execute :rake, 'spree_auth:admin:create'
        end
      end
    end
  end
  task :create_all do
    on primary fetch(:migration_role) do
      within current_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:create:all'
          # execute :rake, 'spree_auth:admin:create'
        end
      end
    end
  end


  task :rails_console do
    on primary fetch(:migration_role) do
      within current_path do
        with rails_env: fetch(:rails_env)  do
          execute :rails, 'c'
        end
      end
    end
  end

end

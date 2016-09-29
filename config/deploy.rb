# config valid only for current version of Capistrano
lock '3.6.1'

# set :pty, true

set :npm_target_path, -> { release_path } # default not set
set :npm_flags, '--production --silent --no-progress'    # default
set :npm_roles, :all                                     # default
set :npm_env_variables, {}                               # default


set :rails_env, "production"

set :unicorn_worker_count, 5

#set :application, 'uni-portal'

set :deploy_user, 'uni' # for install

#set :nginx_server_name, '192.168.1.33'

set :nginx_server_name, '192.168.1.37'

# Defaults to 'db'
# set :migration_role, 'root'
set :conditionally_migrate, true

set :application, 'uni-wechat'

# set :repo_url, 'git@source.uni-digital.net:ray/uni-portal.git'
set :repo_url, 'git@192.168.1.31:wechat/wechat-web.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/var/www/uni_wechat'

# Default value for :scm is :git
set :scm, :git

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/storage')

set :branch, "zhangyesheng"

set :user, "root" # for Git


# Defaults to nil (no asset cleanup is performed)
# If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# set this to the number of versions to keep
set :keep_releases, 3

#set :assets_roles, [:web, :app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
#set :assets_prefix, 'prepackaged-assets'

#set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}

# Defaults to the primary :db server
#set :migration_role, :db

#set :migration_servers, -> { primary(fetch(:migration_role)) }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
#set :pty, true # 这是 askpass 当需要在 tty 上出现询问时就要设置为真

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :setup do
  # desc "复制 Storage 目录"
  task :copy_images do
    on roles(:all) do |host|
      upload! "public/storage", "#{shared_path}/public/", recursive: true
    end
  end
end

namespace :deploy do

  task :load_data do |host|
    on roles(:web, :app, :db) do
      within current_path do
        execute :rake, 'db:fixtures:load RAILS_ENV=production'
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
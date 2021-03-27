# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "app"
set :repo_url, "git@github.com:yosefbennywidyo/rails-with-ansible-capistrano-and-semaphore.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/apps"
set :chruby_ruby, "ruby-3.0.0"

# Skip precompile assets
set :assets_roles, []

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "./bundle", "public/system"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/shared/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/shared/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/shared/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_control_app, false
set :puma_default_control_app, "unix://#{shared_path}/shared/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/shared/log/puma_access.log"
set :puma_error_log, "#{shared_path}/shared/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, false
set :puma_daemonize, false
set :puma_plugins, []  #accept array of plugins
set :puma_tag, fetch(:application)
set :puma_restart_command, 'bundle exec puma'
set :puma_service_unit_name, "puma_#{fetch(:application)}_#{fetch(:stage)}"
set :puma_systemctl_user, :system # accepts :user
set :puma_enable_lingering, fetch(:puma_systemctl_user) != :system # https://wiki.archlinux.org/index.php/systemd/User#Automatic_start-up_of_systemd_user_instances
set :puma_lingering_user, fetch(:user)
set :puma_service_unit_env_file, nil
set :puma_service_unit_env_vars, []

set :nginx_config_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :nginx_flags, 'fail_timeout=0'
set :nginx_http_flags, fetch(:nginx_flags)
set :nginx_server_name, "localhost #{fetch(:application)}.local"
set :nginx_sites_available_path, '/etc/nginx/sites-available'
set :nginx_sites_enabled_path, '/etc/nginx/sites-enabled'
set :nginx_socket_flags, fetch(:nginx_flags)
set :nginx_ssl_certificate, "/etc/ssl/certs/ca-certificates.crt"
set :nginx_ssl_certificate_key, "/etc/ssl/private/ssl-cert-snakeoil.key"
set :nginx_use_ssl, false
set :nginx_use_http2, true
set :nginx_downstream_uses_ssl, false

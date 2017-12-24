# coding: utf-8

set :application, 'alexa-oauth'
ask :branch, ENV['BRANCH'] || `git rev-parse --abbrev-ref HEAD`.chomp
set :repo_url, "https://github.com/pyama86/alexa-oauth.git"
set :deploy_to, '/opt/alexa-oauth'
append :linked_dirs, 'log', 'tmp/pids','tmp/sockets', 'scripts'
set :linked_files, %w{.env}
set :bundle_roles, :app

ask(:user, ENV['CAPUSER'] || ENV['USER'])
set :format, :airbrussh
set :log_level, :info
set :pty, true
set :use_sudo, false
set :keep_releases, 5

#set :rbenv_path, '~/.rbenv'
set :rbenv_type, :user
set :rbenv_ruby, '2.3.6'
set :rbenv_map_bins, %w{rake gem bundle ruby puma pumactl}
set :puma_bind, ["tcp://0.0.0.0:9292", "unix://#{shared_path}/tmp/sockets/puma.sock"]
SSHKit.config.umask = '002'

set :base_env, {
  app_env: fetch(:stage),
  rack_env: fetch(:stage)
}

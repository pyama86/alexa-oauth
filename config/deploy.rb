# coding: utf-8

set :application, 'oauth-server'
ask :branch, ENV['BRANCH'] || `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/opt/oauth-server'
append :linked_dirs, 'log', 'tmp/pids','tmp/sockets', 'scripts'

set :bundle_roles, :app

ask(:user, ENV['CAPUSER'] || ENV['USER'])
set :format, :airbrussh
set :log_level, :info
set :pty, true
set :use_sudo, false
set :keep_releases, 5

set :puma_bind, ["tcp://0.0.0.0:9292", "unix://#{shared_path}/tmp/sockets/puma.sock"]
SSHKit.config.umask = '002'

set :base_env, {
  app_env: fetch(:stage),
  rack_env: fetch(:stage)
}

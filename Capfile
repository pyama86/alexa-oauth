# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/scm/git'
require 'capistrano/puma'
require 'capistrano/rbenv'
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

desc 'check connectivity to servers.'
task :hello do
  on roles(:app, :worker) do |_host|
    execute :hostname
    execute :id
  end
end

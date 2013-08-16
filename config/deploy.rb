set :application, "rcdb"
set :repository,  "git@github.com:justinj/reconstruction-database.git"

set :scm, :git

role :web, "www"
role :app, "www"

set :deploy_to, "/home/www/rcdb"
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "#{try_sudo} cd #{current_path}; bundle install --deployment"
  end
end

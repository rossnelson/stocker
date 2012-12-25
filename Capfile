require "rvm/capistrano"
require "bundler/capistrano"

load 'deploy'
# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'
#load 'config/deploy' # remove this line to skip loading any of the default tasks

# Kinda hard to figure out:
# run this:
#
# Local Machine:
# cat ~/.ssh/id_rsa.pub | ssh #{git_user}@#{git_server} 'cat >> ~/.ssh/authorized_keys'
# cat ~/.ssh/id_rsa.pub | ssh #{web_user}@#{web_server} 'cat >> ~/.ssh/authorized_keys'
#
# Web Server:
# cat ~/.ssh/id_rsa.pub | ssh #{git_user}@#{git_server} 'cat >> ~/.ssh/authorized_keys'
set :rvm_ruby_string, 'ruby-1.9.3-p0@stocker'

set :scm, :git
set :repository, "git@phaser.imagemanagement.com:git/stocker.git"
set :deploy_via, :remote_cache

set :use_sudo, false
set :user, 'admin'
server "ganon.imagemanagement.com", :app, :web, :db, :primary => true
set :deploy_to, "/Library/WebServer/stocker"

set :keep_releases, 1

after 'deploy', 'restart'
after "deploy", "deploy:cleanup"

desc "Tell Passenger to restart the app."
task :restart do
  run "touch #{current_path}/tmp/restart.txt"
end

desc "Echo the server's hostname"
task :host_name do
  run "echo `hostname`"
end


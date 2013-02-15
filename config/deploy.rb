# config/deploy.rb
require 'bundler/capistrano'
# be sure to change these
set :user, 'herman'
set :domain, 'depot.szkolenie.com'
set :application, 'depot'
 
# adjust if you are using RVM, remove if you are not
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

ssh_options[:forward_agent] = true # add this
# ssh_options[:verbose] = :debug
ssh_options[:auth_methods] = ['publickey', 'password'] ## MAGIC!!!!!!!!!!!!!1
 
# file paths
set :repository,  "git@github.com:gentoo-pl/depot.git" 
# set :repository,  "#{user}@#{domain}:git/#{application}.git"
# set :deploy_to, "/home/#{user}/WORK/szkolenia/#{domain}"
set :deploy_to, "/home/#{user}/WORK/szkolenia/#{domain}" 
 
# distribute your applications across servers (the 
# instructions below put them
# all on the same server, defined above as 
#'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true
 
# config/deploy.rb
# you might need to set this if you aren't seeing password prompts
#default_run_options[:pty] = true ## bedzie pytal o hasla jak nie ma klucza
 
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production
 
namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; \
      rake db:seed RAILS_ENV=#{rails_env}"
  end
end
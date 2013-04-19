#-*- encoding : utf-8 -*-
default_environment["PATH"] = "/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

set :application, "rails101_forum"
set :domain, "ec2-54-248-164-60.ap-northeast-1.compute.amazonaws.com"
set :repository, "git@github.com:maximx/rails101_forum.git"
set :deploy_to, "/home/apps/rails101_forum"

set :branch, "master"
set :scm, :git

set :user, "apps"
set :group, "apps"

set :deploy_to, "/home/apps/#{application}"
set :runner, "apps"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :use_sudo, false

role :web, "#{domain}"
role :app, "#{domain}"
role :db, "#{domain}", :primary => true

set :deploy_env, "production"
set :rails_env, "production"
set :scm_verbose, true

namespace :my_task do
  task :symlink, :roles => [:web] do
    run "mkdir -p #{deploy_to}/shared/log"
    run "mkdir -p #{deploy_to}/shared/pids"

    symlink_hash = {
      "#{shared_path}/config/database.yml.production" => "#{release_path}/config/database.yml"
    }
    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end

  end
end

after "deploy:finalize_update", "my_task:symlink"
after "deploy:restart", "unicorn:reload"

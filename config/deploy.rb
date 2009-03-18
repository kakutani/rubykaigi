# -*- coding: utf-8 -*-
set :application, "rubykaigi"
set :repository,  "git://github.com/kakutani/rubykaigi.git"
set :branch, "master"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{application}/railsapp"
set :ssh_options, { :forward_agent => true }

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :git_shallow_clone, 1

set :use_sudo, false
set :runner, "rubykaigi"
ssh_options[:username] = application

set :production_server, "rubykaigi.org"
role :app, production_server
role :web, production_server
role :db,  production_server, :primary => true

set :rake, "/home/#{application}/bin/rake"

def setup_shared(dir, path)
  src = "#{shared_path}/#{dir}/#{path}"
  dest = "#{latest_release}/#{dir}/#{path}"
  run "! test -e #{dest} && ln -s #{src} #{dest}"
end

def setup_shared_config(path)
  setup_shared("config", path)
end

namespace :deploy do
  task :after_update_code do
    setup_shared_config("database.yml")
    setup_shared("db", "production.sqlite3")
  end

  task :start do
    run "touch #{latest_release}/tmp/restart.txt"
  end

  desc "resart our application"
  task :restart do
    start
  end

  task :stop do
  end
end

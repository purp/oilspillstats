set :application, "oilspillstats"
set :repository,  "git@github.com:purp/oilspillstats.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/home/oilspillstats/oilspillstats.com"
default_run_options[:pty] = true


# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, "git"
set :git_enable_submodules, true
set :deploy_via, :remote_cache
set :ssh_options, {:forward_agent => true}


task :production do
  set :deployment, 'production'
  set :branch, 'master'
  set :domain, 'oilspillstats.com'
  role :app, "oilspillstats.com"
  role :web, "oilspillstats.com"
  role :db,  "mysql.oilspillstats.com", :no_release => true, :primary => true
  
  namespace :deploy do
    desc "Restarting mod_rails with restart.txt"
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "touch #{current_path}/tmp/restart.txt"
    end

    [:start, :stop].each do |t|
      desc "#{t} task is a no-op with mod_rails"
      task t, :roles => :app do ; end
    end
  end
  
  desc "Force a gem rebuild"
  task :post_deploy_chores, :roles => :app, :except => { :no_release => true } do
    run "cd #{latest_release} && rake rebuild:gems:force && rake link_timeline_data"
  end

  after "deploy:update_code", :post_deploy_chores
end

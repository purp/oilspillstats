desc "Deployment helper: rebuild gems and link in shared data"
task :post_deploy_chores => [:environment, "gems:rebuild:force"] do
  src = Rails.root.parent.parent + 'shared' + 'timeline_data.js'
  dest = Rails.root + 'public' + 'javascripts' + 'timeline_data.js'
  
  dest.make_symlink(src)
end

  
desc "Link in timeline data"
task :link_timeline_data => :environment do
  src = Rails.root.parent.parent + 'shared' + 'timeline_data.js'
  dest = Rails.root + 'public' + 'javascripts' + 'timeline_data.js'
  
  dest.make_symlink(src)
end

  
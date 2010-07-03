tl = Timeline.first
if tl.source.updated_at < 5.minutes.ago

  tl.source.refresh!

  outdir = (Rails.env == 'production') ? Rails.root.parent.parent + 'shared' : Rails.root + 'public' + 'javascripts'
  outfile =  outdir + 'timeline_data.js'
  tl_data = open(outfile, 'w')

  tl_data.write("
  var first_event_time = new Date(Date.parse(#{tl.start_time.to_simile}));
  var last_event_time = new Date(Date.parse(#{tl.end_time.to_simile}));
  var tl_start = first_event_time; 
  var tl_end = new Date(Date.parse(#{(tl.end_time + 1.week).to_simile}));
  var elapsed_days = #{((Time.now - tl.start_time) / 1.day).truncate};
  var update_time = #{Time.now.to_simile};

  var timeline_data = {  // save as a global variable
      'dateTimeFormat': 'iso8601',
      'events' : #{tl.to_json}
  }")

  tl_data.close
end

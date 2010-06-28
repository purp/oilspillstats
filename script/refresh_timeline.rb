tl = Timeline.first
tl.source.refresh!

tl_data = open(File.join(Rails.root, 'public', 'javascripts', 'timeline_data.js'), 'w')

tl_data.write("
var first_event_time = new Date(Date.parse(#{tl.start_time.to_simile}));
var last_event_time = new Date(Date.parse(#{tl.end_time.to_simile}));
var tl_start = first_event_time; 
var tl_end = new Date(Date.parse(#{(tl.end_time + 1.week).to_simile}));
var elapsed_days = #{tl.duration.truncate};

var timeline_data = {  // save as a global variable
    'dateTimeFormat': 'iso8601',
    'events' : #{tl.to_json}
}")

tl_data.close

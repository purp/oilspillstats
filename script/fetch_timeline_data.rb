require 'open-uri'
require 'date'

@timeline = Timeline.find_by_title('Deepwater Horizon Response')

data = open("timeline_data.js", 'w')
data.puts "var timeline_data = {  // save as a global variable
'dateTimeFormat': 'iso8601',
'events' : #{@timeline.to_json}}
"
data.close  

require 'spec_helper'

describe "/timeline_events/new.html.erb" do
  include TimelineEventsHelper

  before(:each) do
    assigns[:timeline_event] = stub_model(TimelineEvent,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :image => "value for image",
      :link => "value for link",
      :hash => "value for hash",
      :timeline_id => 1
    )
  end

  it "renders new timeline_event form" do
    render

    response.should have_tag("form[action=?][method=post]", timeline_events_path) do
      with_tag("input#timeline_event_title[name=?]", "timeline_event[title]")
      with_tag("textarea#timeline_event_description[name=?]", "timeline_event[description]")
      with_tag("input#timeline_event_image[name=?]", "timeline_event[image]")
      with_tag("input#timeline_event_link[name=?]", "timeline_event[link]")
      with_tag("input#timeline_event_hash[name=?]", "timeline_event[hash]")
      with_tag("input#timeline_event_timeline_id[name=?]", "timeline_event[timeline_id]")
    end
  end
end

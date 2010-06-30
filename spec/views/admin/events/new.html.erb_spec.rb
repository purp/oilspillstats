require 'spec_helper'

describe "/admin/events/new.html.erb" do
  include Admin::EventsHelper

  before(:each) do
    assigns[:event] = stub_model(Event,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :image => "value for image",
      :link => "value for link",
      :hash => "value for hash",
      :timeline_id => 1
    )
  end

  it "renders new event form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_events_path) do
      with_tag("input#event_title[name=?]", "event[title]")
      with_tag("textarea#event_description[name=?]", "event[description]")
      with_tag("input#event_image[name=?]", "event[image]")
      with_tag("input#event_link[name=?]", "event[link]")
      with_tag("input#event_hash[name=?]", "event[hash]")
      with_tag("input#event_timeline_id[name=?]", "event[timeline_id]")
    end
  end
end

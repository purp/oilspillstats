require 'spec_helper'

describe "/timeline_events/show.html.erb" do
  include TimelineEventsHelper
  before(:each) do
    assigns[:timeline_event] = @timeline_event = stub_model(TimelineEvent,
      :title => "value for title",
      :description => "value for description",
      :image => "value for image",
      :link => "value for link",
      :hash => "value for hash",
      :timeline_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ image/)
    response.should have_text(/value\ for\ link/)
    response.should have_text(/value\ for\ hash/)
    response.should have_text(/1/)
  end
end

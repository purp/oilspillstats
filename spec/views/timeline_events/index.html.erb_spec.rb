require 'spec_helper'

describe "/timeline_events/index.html.erb" do
  include TimelineEventsHelper

  before(:each) do
    assigns[:timeline_events] = [
      stub_model(TimelineEvent,
        :title => "value for title",
        :description => "value for description",
        :image => "value for image",
        :link => "value for link",
        :hash => "value for hash",
        :timeline_id => 1
      ),
      stub_model(TimelineEvent,
        :title => "value for title",
        :description => "value for description",
        :image => "value for image",
        :link => "value for link",
        :hash => "value for hash",
        :timeline_id => 1
      )
    ]
  end

  it "renders a list of timeline_events" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for image".to_s, 2)
    response.should have_tag("tr>td", "value for link".to_s, 2)
    response.should have_tag("tr>td", "value for hash".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

require 'spec_helper'

describe "/admin/events/index.html.erb" do
  include Admin::EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Event,
        :title => "value for title",
        :description => "value for description",
        :image => "value for image",
        :link => "value for link",
        :hash => "value for hash",
        :timeline_id => 1
      ),
      stub_model(Event,
        :title => "value for title",
        :description => "value for description",
        :image => "value for image",
        :link => "value for link",
        :hash => "value for hash",
        :timeline_id => 1
      )
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for image".to_s, 2)
    response.should have_tag("tr>td", "value for link".to_s, 2)
    response.should have_tag("tr>td", "value for hash".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

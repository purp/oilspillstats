require 'spec_helper'

describe "/timelines/index.html.erb" do
  include TimelinesHelper

  before(:each) do
    assigns[:timelines] = [
      stub_model(Timeline,
        :title => "value for title",
        :source => "value for source",
        :template => "value for template"
      ),
      stub_model(Timeline,
        :title => "value for title",
        :source => "value for source",
        :template => "value for template"
      )
    ]
  end

  it "renders a list of timelines" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for source".to_s, 2)
    response.should have_tag("tr>td", "value for template".to_s, 2)
  end
end

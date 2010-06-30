require 'spec_helper'

describe "/admin/timelines/show.html.erb" do
  include Admin::TimelinesHelper
  before(:each) do
    assigns[:timeline] = @timeline = stub_model(Timeline,
      :title => "value for title",
      :source => "value for source",
      :template => "value for template"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ source/)
    response.should have_text(/value\ for\ template/)
  end
end

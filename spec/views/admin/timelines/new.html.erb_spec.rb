require 'spec_helper'

describe "/admin/timelines/new.html.erb" do
  include Admin::TimelinesHelper

  before(:each) do
    assigns[:timeline] = stub_model(Timeline,
      :new_record? => true,
      :title => "value for title",
      :source => "value for source",
      :template => "value for template"
    )
  end

  it "renders new timeline form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_timelines_path) do
      with_tag("input#timeline_title[name=?]", "timeline[title]")
      with_tag("input#timeline_source[name=?]", "timeline[source]")
      with_tag("textarea#timeline_template[name=?]", "timeline[template]")
    end
  end
end

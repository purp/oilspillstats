require 'spec_helper'

describe "/admin/timelines/edit.html.erb" do
  include Admin::TimelinesHelper

  before(:each) do
    assigns[:timeline] = @timeline = stub_model(Timeline,
      :new_record? => false,
      :title => "value for title",
      :source => "value for source",
      :template => "value for template"
    )
  end

  it "renders the edit timeline form" do
    render

    response.should have_tag("form[action=#{admin_timeline_path(@timeline)}][method=post]") do
      with_tag('input#timeline_title[name=?]', "timeline[title]")
      with_tag('input#timeline_source[name=?]', "timeline[source]")
      with_tag('textarea#timeline_template[name=?]', "timeline[template]")
    end
  end
end

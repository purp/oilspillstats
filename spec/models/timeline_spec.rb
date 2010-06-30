require 'spec_helper'

describe Timeline do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :template => "value for template"
    }
  end

  it "should create a new instance given valid attributes" do
    Timeline.create!(@valid_attributes)
  end
end

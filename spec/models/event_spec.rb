require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :start => Time.now,
      :end => Time.now,
      :title => "value for title",
      :description => "value for description",
      :image => "value for image",
      :link => "value for link",
      :source_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end

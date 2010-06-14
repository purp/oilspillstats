require 'spec_helper'

describe TimelineEvent do
  before(:each) do
    @valid_attributes = {
      :start => Time.now,
      :end => Time.now,
      :title => "value for title",
      :description => "value for description",
      :image => "value for image",
      :link => "value for link",
      :hash => "value for hash",
      :timeline_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    TimelineEvent.create!(@valid_attributes)
  end
end

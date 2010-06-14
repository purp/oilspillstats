require 'spec_helper'

describe TimelineEventsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/timeline_events" }.should route_to(:controller => "timeline_events", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/timeline_events/new" }.should route_to(:controller => "timeline_events", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/timeline_events/1" }.should route_to(:controller => "timeline_events", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/timeline_events/1/edit" }.should route_to(:controller => "timeline_events", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/timeline_events" }.should route_to(:controller => "timeline_events", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/timeline_events/1" }.should route_to(:controller => "timeline_events", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/timeline_events/1" }.should route_to(:controller => "timeline_events", :action => "destroy", :id => "1") 
    end
  end
end

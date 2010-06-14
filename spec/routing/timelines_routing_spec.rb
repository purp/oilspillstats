require 'spec_helper'

describe TimelinesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/timelines" }.should route_to(:controller => "timelines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/timelines/new" }.should route_to(:controller => "timelines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/timelines/1" }.should route_to(:controller => "timelines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/timelines/1/edit" }.should route_to(:controller => "timelines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/timelines" }.should route_to(:controller => "timelines", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/timelines/1" }.should route_to(:controller => "timelines", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/timelines/1" }.should route_to(:controller => "timelines", :action => "destroy", :id => "1") 
    end
  end
end

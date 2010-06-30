require 'spec_helper'

describe Admin::TimelinesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin/timelines" }.should route_to(:controller => "admin/timelines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/timelines/new" }.should route_to(:controller => "admin/timelines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/timelines/1" }.should route_to(:controller => "admin/timelines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/timelines/1/edit" }.should route_to(:controller => "admin/timelines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/timelines" }.should route_to(:controller => "admin/timelines", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admin/timelines/1" }.should route_to(:controller => "admin/timelines", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/timelines/1" }.should route_to(:controller => "admin/timelines", :action => "destroy", :id => "1") 
    end
  end
end

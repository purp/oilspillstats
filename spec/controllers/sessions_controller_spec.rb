require 'spec_helper'

describe SessionsController do

  #Delete these examples and add some real ones
  it "should use SessionsController" do
    controller.should be_an_instance_of(SessionsController)
  end


  describe "GET 'signin'" do
    it "should be successful" do
      get 'signin'
      response.should be_success
    end
  end

  describe "GET 'signout'" do
    it "should be successful" do
      get 'signout'
      response.should be_success
    end
  end
end

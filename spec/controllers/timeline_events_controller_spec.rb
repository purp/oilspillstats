require 'spec_helper'

describe TimelineEventsController do

  def mock_timeline_event(stubs={})
    @mock_timeline_event ||= mock_model(TimelineEvent, stubs)
  end

  describe "GET index" do
    it "assigns all timeline_events as @timeline_events" do
      TimelineEvent.stub!(:find).with(:all).and_return([mock_timeline_event])
      get :index
      assigns[:timeline_events].should == [mock_timeline_event]
    end
  end

  describe "GET show" do
    it "assigns the requested timeline_event as @timeline_event" do
      TimelineEvent.stub!(:find).with("37").and_return(mock_timeline_event)
      get :show, :id => "37"
      assigns[:timeline_event].should equal(mock_timeline_event)
    end
  end

  describe "GET new" do
    it "assigns a new timeline_event as @timeline_event" do
      TimelineEvent.stub!(:new).and_return(mock_timeline_event)
      get :new
      assigns[:timeline_event].should equal(mock_timeline_event)
    end
  end

  describe "GET edit" do
    it "assigns the requested timeline_event as @timeline_event" do
      TimelineEvent.stub!(:find).with("37").and_return(mock_timeline_event)
      get :edit, :id => "37"
      assigns[:timeline_event].should equal(mock_timeline_event)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created timeline_event as @timeline_event" do
        TimelineEvent.stub!(:new).with({'these' => 'params'}).and_return(mock_timeline_event(:save => true))
        post :create, :timeline_event => {:these => 'params'}
        assigns[:timeline_event].should equal(mock_timeline_event)
      end

      it "redirects to the created timeline_event" do
        TimelineEvent.stub!(:new).and_return(mock_timeline_event(:save => true))
        post :create, :timeline_event => {}
        response.should redirect_to(timeline_event_url(mock_timeline_event))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved timeline_event as @timeline_event" do
        TimelineEvent.stub!(:new).with({'these' => 'params'}).and_return(mock_timeline_event(:save => false))
        post :create, :timeline_event => {:these => 'params'}
        assigns[:timeline_event].should equal(mock_timeline_event)
      end

      it "re-renders the 'new' template" do
        TimelineEvent.stub!(:new).and_return(mock_timeline_event(:save => false))
        post :create, :timeline_event => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested timeline_event" do
        TimelineEvent.should_receive(:find).with("37").and_return(mock_timeline_event)
        mock_timeline_event.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :timeline_event => {:these => 'params'}
      end

      it "assigns the requested timeline_event as @timeline_event" do
        TimelineEvent.stub!(:find).and_return(mock_timeline_event(:update_attributes => true))
        put :update, :id => "1"
        assigns[:timeline_event].should equal(mock_timeline_event)
      end

      it "redirects to the timeline_event" do
        TimelineEvent.stub!(:find).and_return(mock_timeline_event(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(timeline_event_url(mock_timeline_event))
      end
    end

    describe "with invalid params" do
      it "updates the requested timeline_event" do
        TimelineEvent.should_receive(:find).with("37").and_return(mock_timeline_event)
        mock_timeline_event.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :timeline_event => {:these => 'params'}
      end

      it "assigns the timeline_event as @timeline_event" do
        TimelineEvent.stub!(:find).and_return(mock_timeline_event(:update_attributes => false))
        put :update, :id => "1"
        assigns[:timeline_event].should equal(mock_timeline_event)
      end

      it "re-renders the 'edit' template" do
        TimelineEvent.stub!(:find).and_return(mock_timeline_event(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested timeline_event" do
      TimelineEvent.should_receive(:find).with("37").and_return(mock_timeline_event)
      mock_timeline_event.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the timeline_events list" do
      TimelineEvent.stub!(:find).and_return(mock_timeline_event(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(timeline_events_url)
    end
  end

end

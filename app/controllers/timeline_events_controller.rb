class TimelineEventsController < ApplicationController
  # GET /timeline_events
  # GET /timeline_events.xml
  def index
    @timeline_events = TimelineEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timeline_events }
    end
  end

  # GET /timeline_events/1
  # GET /timeline_events/1.xml
  def show
    @timeline_event = TimelineEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @timeline_event }
    end
  end

  # GET /timeline_events/new
  # GET /timeline_events/new.xml
  def new
    @timeline_event = TimelineEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @timeline_event }
    end
  end

  # GET /timeline_events/1/edit
  def edit
    @timeline_event = TimelineEvent.find(params[:id])
  end

  # POST /timeline_events
  # POST /timeline_events.xml
  def create
    @timeline_event = TimelineEvent.new(params[:timeline_event])

    respond_to do |format|
      if @timeline_event.save
        flash[:notice] = 'TimelineEvent was successfully created.'
        format.html { redirect_to(@timeline_event) }
        format.xml  { render :xml => @timeline_event, :status => :created, :location => @timeline_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @timeline_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /timeline_events/1
  # PUT /timeline_events/1.xml
  def update
    @timeline_event = TimelineEvent.find(params[:id])

    respond_to do |format|
      if @timeline_event.update_attributes(params[:timeline_event])
        flash[:notice] = 'TimelineEvent was successfully updated.'
        format.html { redirect_to(@timeline_event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @timeline_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /timeline_events/1
  # DELETE /timeline_events/1.xml
  def destroy
    @timeline_event = TimelineEvent.find(params[:id])
    @timeline_event.destroy

    respond_to do |format|
      format.html { redirect_to(timeline_events_url) }
      format.xml  { head :ok }
    end
  end
end

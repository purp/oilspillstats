class Admin::TimelinesController < ApplicationController
  layout "timelines"
  
  # GET /admin/timelines
  # GET /admin/timelines.xml
  def index
    @timelines = Timeline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timelines }
    end
  end

  # GET /admin/timelines/1
  # GET /admin/timelines/1.xml
  def show
    @timeline = Timeline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @timeline }
      format.json { render :xml => @timeline }
    end
  end

  # GET /admin/timelines/new
  # GET /admin/timelines/new.xml
  def new
    @timeline = Timeline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @timeline }
    end
  end

  # GET /admin/timelines/1/edit
  def edit
    @timeline = Timeline.find(params[:id])
  end

  # POST /admin/timelines
  # POST /admin/timelines.xml
  def create
    @timeline = Timeline.new(params[:timeline])

    respond_to do |format|
      if @timeline.save
        flash[:notice] = 'Timeline was successfully created.'
        format.html { redirect_to([:admin, @timeline]) }
        format.xml  { render :xml => @timeline, :status => :created, :location => @timeline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @timeline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/timelines/1
  # PUT /admin/timelines/1.xml
  def update
    @timeline = Timeline.find(params[:id])

    respond_to do |format|
      if @timeline.update_attributes(params[:timeline])
        flash[:notice] = 'Timeline was successfully updated.'
        format.html { redirect_to([:admin, @timeline]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @timeline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/timelines/1
  # DELETE /admin/timelines/1.xml
  def destroy
    @timeline = Timeline.find(params[:id])
    @timeline.destroy

    respond_to do |format|
      format.html { redirect_to(admin_timelines_url) }
      format.xml  { head :ok }
    end
  end
  
  def timeline
    @timeline = params[:id] ? Timeline.find(params[:id]) : Timeline.first
    @source = @timeline.source
    @source.refresh!
    
    respond_to do |format|
      format.html # timeline.html.erb
    end
  end
end

class Admin::SourcesController < Admin::BaseController  
  # GET /admin/sources
  # GET /admin/sources.xml
  def index
    @sources = Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sources }
    end
  end

  # GET /admin/sources/1
  # GET /admin/sources/1.xml
  def show
    @source = Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @source }
      format.json { render :xml => @source }
    end
  end

  # GET /admin/sources/new
  # GET /admin/sources/new.xml
  def new
    @source = Source.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @source }
    end
  end

  # GET /admin/sources/1/edit
  def edit
    @source = Source.find(params[:id])
  end

  # POST /admin/sources
  # POST /admin/sources.xml
  def create
    @source = Source.new(params[:source])

    respond_to do |format|
      if @source.save
        flash[:notice] = 'Source was successfully created.'
        format.html { redirect_to([:admin, @source]) }
        format.xml  { render :xml => @source, :status => :created, :location => @source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/sources/1
  # PUT /admin/sources/1.xml
  def update
    @source = Source.find(params[:id])

    respond_to do |format|
      if @source.update_attributes(params[:source])
        flash[:notice] = 'Source was successfully updated.'
        format.html { redirect_to([:admin, @source]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sources/1
  # DELETE /admin/sources/1.xml
  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sources_url) }
      format.xml  { head :ok }
    end
  end
  
  def source
    @source = params[:id] ? Source.find(params[:id]) : Source.first
    @source = @source.source
    @source.refresh!
    
    respond_to do |format|
      format.html # source.html.erb
    end
  end
end

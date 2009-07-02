class RitesPortal::DistrictsController < ApplicationController
  # GET /rites_portal_districts
  # GET /rites_portal_districts.xml
  def index
    @districts = RitesPortal::District.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts }
    end
  end

  # GET /rites_portal_districts/1
  # GET /rites_portal_districts/1.xml
  def show
    @district = RitesPortal::District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @district }
    end
  end

  # GET /rites_portal_districts/new
  # GET /rites_portal_districts/new.xml
  def new
    @district = RitesPortal::District.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @district }
    end
  end

  # GET /rites_portal_districts/1/edit
  def edit
    @district = RitesPortal::District.find(params[:id])
  end

  # POST /rites_portal_districts
  # POST /rites_portal_districts.xml
  def create
    @district = RitesPortal::District.new(params[:district])

    respond_to do |format|
      if @district.save
        flash[:notice] = 'RitesPortal::District was successfully created.'
        format.html { redirect_to(@district) }
        format.xml  { render :xml => @district, :status => :created, :location => @district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_districts/1
  # PUT /rites_portal_districts/1.xml
  def update
    @district = RitesPortal::District.find(params[:id])

    respond_to do |format|
      if @district.update_attributes(params[:district])
        flash[:notice] = 'RitesPortal::District was successfully updated.'
        format.html { redirect_to(@district) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_districts/1
  # DELETE /rites_portal_districts/1.xml
  def destroy
    @district = RitesPortal::District.find(params[:id])
    @district.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_districts_url) }
      format.xml  { head :ok }
    end
  end
end

class RitesPortal::Nces06DistrictsController < ApplicationController
  # GET /rites_portal_nces06_districts
  # GET /rites_portal_nces06_districts.xml
  def index
    @nces06_districts = RitesPortal::Nces06District.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nces06_districts }
    end
  end

  # GET /rites_portal_nces06_districts/1
  # GET /rites_portal_nces06_districts/1.xml
  def show
    @nces06_district = RitesPortal::Nces06District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nces06_district }
    end
  end

  # GET /rites_portal_nces06_districts/new
  # GET /rites_portal_nces06_districts/new.xml
  def new
    @nces06_district = RitesPortal::Nces06District.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nces06_district }
    end
  end

  # GET /rites_portal_nces06_districts/1/edit
  def edit
    @nces06_district = RitesPortal::Nces06District.find(params[:id])
  end

  # POST /rites_portal_nces06_districts
  # POST /rites_portal_nces06_districts.xml
  def create
    @nces06_district = RitesPortal::Nces06District.new(params[:nces06_district])

    respond_to do |format|
      if @nces06_district.save
        flash[:notice] = 'RitesPortal::Nces06District was successfully created.'
        format.html { redirect_to(@nces06_district) }
        format.xml  { render :xml => @nces06_district, :status => :created, :location => @nces06_district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nces06_district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_nces06_districts/1
  # PUT /rites_portal_nces06_districts/1.xml
  def update
    @nces06_district = RitesPortal::Nces06District.find(params[:id])

    respond_to do |format|
      if @nces06_district.update_attributes(params[:nces06_district])
        flash[:notice] = 'RitesPortal::Nces06District was successfully updated.'
        format.html { redirect_to(@nces06_district) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nces06_district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_nces06_districts/1
  # DELETE /rites_portal_nces06_districts/1.xml
  def destroy
    @nces06_district = RitesPortal::Nces06District.find(params[:id])
    @nces06_district.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_nces06_districts_url) }
      format.xml  { head :ok }
    end
  end
end

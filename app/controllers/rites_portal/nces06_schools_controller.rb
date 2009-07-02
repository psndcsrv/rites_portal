class RitesPortal::Nces06SchoolsController < ApplicationController
  # GET /rites_portal_nces06_schools
  # GET /rites_portal_nces06_schools.xml
  def index
    @nces06_schools = RitesPortal::Nces06School.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nces06_schools }
    end
  end

  # GET /rites_portal_nces06_schools/1
  # GET /rites_portal_nces06_schools/1.xml
  def show
    @nces06_school = RitesPortal::Nces06School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nces06_school }
    end
  end

  # GET /rites_portal_nces06_schools/new
  # GET /rites_portal_nces06_schools/new.xml
  def new
    @nces06_school = RitesPortal::Nces06School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nces06_school }
    end
  end

  # GET /rites_portal_nces06_schools/1/edit
  def edit
    @nces06_school = RitesPortal::Nces06School.find(params[:id])
  end

  # POST /rites_portal_nces06_schools
  # POST /rites_portal_nces06_schools.xml
  def create
    @nces06_school = RitesPortal::Nces06School.new(params[:nces06_school])

    respond_to do |format|
      if @nces06_school.save
        flash[:notice] = 'RitesPortal::Nces06School was successfully created.'
        format.html { redirect_to(@nces06_school) }
        format.xml  { render :xml => @nces06_school, :status => :created, :location => @nces06_school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nces06_school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_nces06_schools/1
  # PUT /rites_portal_nces06_schools/1.xml
  def update
    @nces06_school = RitesPortal::Nces06School.find(params[:id])

    respond_to do |format|
      if @nces06_school.update_attributes(params[:nces06_school])
        flash[:notice] = 'RitesPortal::Nces06School was successfully updated.'
        format.html { redirect_to(@nces06_school) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nces06_school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_nces06_schools/1
  # DELETE /rites_portal_nces06_schools/1.xml
  def destroy
    @nces06_school = RitesPortal::Nces06School.find(params[:id])
    @nces06_school.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_nces06_schools_url) }
      format.xml  { head :ok }
    end
  end
end

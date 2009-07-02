class RitesPortal::SchoolsController < ApplicationController
  # GET /rites_portal_schools
  # GET /rites_portal_schools.xml
  def index
    @schools = RitesPortal::School.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /rites_portal_schools/1
  # GET /rites_portal_schools/1.xml
  def show
    @school = RitesPortal::School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /rites_portal_schools/new
  # GET /rites_portal_schools/new.xml
  def new
    @school = RitesPortal::School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /rites_portal_schools/1/edit
  def edit
    @school = RitesPortal::School.find(params[:id])
  end

  # POST /rites_portal_schools
  # POST /rites_portal_schools.xml
  def create
    @school = RitesPortal::School.new(params[:school])

    respond_to do |format|
      if @school.save
        flash[:notice] = 'RitesPortal::School was successfully created.'
        format.html { redirect_to(@school) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_schools/1
  # PUT /rites_portal_schools/1.xml
  def update
    @school = RitesPortal::School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'RitesPortal::School was successfully updated.'
        format.html { redirect_to(@school) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_schools/1
  # DELETE /rites_portal_schools/1.xml
  def destroy
    @school = RitesPortal::School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_schools_url) }
      format.xml  { head :ok }
    end
  end
end

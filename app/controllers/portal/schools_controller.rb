class Portal::SchoolsController < ApplicationController
  # GET /portal_schools
  # GET /portal_schools.xml
  def index
    @schools = Portal::School.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /portal_schools/1
  # GET /portal_schools/1.xml
  def show
    @school = Portal::School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /portal_schools/new
  # GET /portal_schools/new.xml
  def new
    @school = Portal::School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /portal_schools/1/edit
  def edit
    @school = Portal::School.find(params[:id])
  end

  # POST /portal_schools
  # POST /portal_schools.xml
  def create
    @school = Portal::School.new(params[:school])

    respond_to do |format|
      if @school.save
        flash[:notice] = 'Portal::School was successfully created.'
        format.html { redirect_to(@school) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portal_schools/1
  # PUT /portal_schools/1.xml
  def update
    @school = Portal::School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'Portal::School was successfully updated.'
        format.html { redirect_to(@school) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portal_schools/1
  # DELETE /portal_schools/1.xml
  def destroy
    @school = Portal::School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(portal_schools_url) }
      format.xml  { head :ok }
    end
  end
end

class Portal::SchoolsController < ApplicationController
  # GET /portal_schools
  # GET /portal_schools.xml
  def index
    @portal_schools = Portal::School.search(params[:search], params[:page], nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portal_schools }
    end
  end

  # GET /portal_schools/1
  # GET /portal_schools/1.xml
  def show
    @portal_school = Portal::School.find(params[:id])
    if request.xhr?
      render :partial => 'remote_form', :locals => { :portal_school => @portal_school }
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @portal_school }
      end
    end
  end

  # GET /portal_schools/new
  # GET /portal_schools/new.xml
  def new
    @portal_school = Portal::School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portal_school }
    end
  end

  # GET /portal_schools/1/edit
  def edit
    @portal_school = Portal::School.find(params[:id])
    if request.xhr?
      render :partial => 'remote_form', :locals => { :portal_school => @portal_school }
    else
      respond_to do |format|
        format.html
        format.xml  { render :xml => @portal_school }
      end
    end
  end

  # POST /portal_schools
  # POST /portal_schools.xml
  def create
    cancel = params[:commit] == "Cancel"
    @portal_school = Portal::School.new(params[:portal_school])
    if request.xhr?
      if cancel 
        redirect_to :index
      elsif @portal_school.save
        render :partial => 'new', :locals => { :portal_school => @portal_school }
      else
        render :xml => @portal_school.errors, :status => :unprocessable_entity
      end
    else
      respond_to do |format|
        if @portal_school.save
          flash[:notice] = 'Portal::School was successfully created.'
          format.html { redirect_to(@portal_school) }
          format.xml  { render :xml => @portal_school, :status => :created, :location => @portal_school }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @portal_school.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /portal_schools/1
  # PUT /portal_schools/1.xml
  def update
    cancel = params[:commit] == "Cancel"
    @portal_school = Portal::School.find(params[:id])
    if request.xhr?
      if cancel || @portal_school.update_attributes(params[:portal_school])
        render :partial => 'show', :locals => { :portal_school => @portal_school }
      else
        render :xml => @portal_school.errors, :status => :unprocessable_entity
      end
    else
      respond_to do |format|
        if @portal_school.update_attributes(params[:portal_school])
          flash[:notice] = 'Portal::School was successfully updated.'
          format.html { redirect_to(@portal_school) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @portal_school.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /portal_schools/1
  # DELETE /portal_schools/1.xml
  def destroy
    @portal_school = Portal::School.find(params[:id])
    @portal_school.destroy

    respond_to do |format|
      format.html { redirect_to(portal_schools_url) }
      format.xml  { head :ok }
    end
  end
end

class Portal::SchoolsController < ApplicationController
  # GET /portal_schools
  # GET /portal_schools.xml
  def index
    @schools = Portal::School.search(params[:search], params[:page], nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /portal_schools/1
  # GET /portal_schools/1.xml
  def show
    @school = Portal::School.find(params[:id])
    if request.xhr?
      render :partial => 'remote_form', :locals => { :school => @school }
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @school }
      end
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
    if request.xhr?
      render :partial => 'remote_form', :locals => { :school => @school }
    else
      respond_to do |format|
        format.html
        format.xml  { render :xml => @school }
      end
    end
  end

  # POST /portal_schools
  # POST /portal_schools.xml
  def create
    cancel = params[:commit] == "Cancel"
    @school = Portal::School.new(params[:school])
    if request.xhr?
      if cancel 
        redirect_to :index
      elsif @school.save
        render :partial => 'new', :locals => { :school => @school }
      else
        render :xml => @school.errors, :status => :unprocessable_entity
      end
    else
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
  end

  # PUT /portal_schools/1
  # PUT /portal_schools/1.xml
  def update
    cancel = params[:commit] == "Cancel"
    @school = Portal::School.find(params[:id])
    if request.xhr?
      if cancel || @school.update_attributes(params[:school])
        render :partial => 'show', :locals => { :school => @school }
      else
        render :xml => @school.errors, :status => :unprocessable_entity
      end
    else
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

class RitesPortal::SemestersController < ApplicationController
  # GET /rites_portal_semesters
  # GET /rites_portal_semesters.xml
  def index
    @rites_portal_semesters = RitesPortal::Semester.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_semesters }
    end
  end

  # GET /rites_portal_semesters/1
  # GET /rites_portal_semesters/1.xml
  def show
    @semester = RitesPortal::Semester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @semester }
    end
  end

  # GET /rites_portal_semesters/new
  # GET /rites_portal_semesters/new.xml
  def new
    @semester = RitesPortal::Semester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @semester }
    end
  end

  # GET /rites_portal_semesters/1/edit
  def edit
    @semester = RitesPortal::Semester.find(params[:id])
  end

  # POST /rites_portal_semesters
  # POST /rites_portal_semesters.xml
  def create
    @semester = RitesPortal::Semester.new(params[:semester])

    respond_to do |format|
      if @semester.save
        flash[:notice] = 'RitesPortal::Semester was successfully created.'
        format.html { redirect_to(@semester) }
        format.xml  { render :xml => @semester, :status => :created, :location => @semester }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @semester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_semesters/1
  # PUT /rites_portal_semesters/1.xml
  def update
    @semester = RitesPortal::Semester.find(params[:id])

    respond_to do |format|
      if @semester.update_attributes(params[:semester])
        flash[:notice] = 'RitesPortal::Semester was successfully updated.'
        format.html { redirect_to(@semester) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @semester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_semesters/1
  # DELETE /rites_portal_semesters/1.xml
  def destroy
    @semester = RitesPortal::Semester.find(params[:id])
    @semester.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_semesters_url) }
      format.xml  { head :ok }
    end
  end
end

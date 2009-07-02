class RitesPortal::CoursesController < ApplicationController
  # GET /rites_portal_courses
  # GET /rites_portal_courses.xml
  def index
    @rites_portal_courses = RitesPortal::Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_courses }
    end
  end

  # GET /rites_portal_courses/1
  # GET /rites_portal_courses/1.xml
  def show
    @course = RitesPortal::Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /rites_portal_courses/new
  # GET /rites_portal_courses/new.xml
  def new
    @course = RitesPortal::Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /rites_portal_courses/1/edit
  def edit
    @course = RitesPortal::Course.find(params[:id])
  end

  # POST /rites_portal_courses
  # POST /rites_portal_courses.xml
  def create
    @course = RitesPortal::Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = 'RitesPortal::Course was successfully created.'
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_courses/1
  # PUT /rites_portal_courses/1.xml
  def update
    @course = RitesPortal::Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = 'RitesPortal::Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_courses/1
  # DELETE /rites_portal_courses/1.xml
  def destroy
    @course = RitesPortal::Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_courses_url) }
      format.xml  { head :ok }
    end
  end
end

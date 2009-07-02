class RitesPortal::TeachersController < ApplicationController
  # GET /rites_portal_teachers
  # GET /rites_portal_teachers.xml
  def index
    @teachers = RitesPortal::Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teachers }
    end
  end

  # GET /rites_portal_teachers/1
  # GET /rites_portal_teachers/1.xml
  def show
    @teacher = RitesPortal::Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /rites_portal_teachers/new
  # GET /rites_portal_teachers/new.xml
  def new
    @teacher = RitesPortal::Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /rites_portal_teachers/1/edit
  def edit
    @teacher = RitesPortal::Teacher.find(params[:id])
  end

  # POST /rites_portal_teachers
  # POST /rites_portal_teachers.xml
  def create
    @teacher = RitesPortal::Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        flash[:notice] = 'RitesPortal::Teacher was successfully created.'
        format.html { redirect_to(@teacher) }
        format.xml  { render :xml => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_teachers/1
  # PUT /rites_portal_teachers/1.xml
  def update
    @teacher = RitesPortal::Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        flash[:notice] = 'RitesPortal::Teacher was successfully updated.'
        format.html { redirect_to(@teacher) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_teachers/1
  # DELETE /rites_portal_teachers/1.xml
  def destroy
    @teacher = RitesPortal::Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_teachers_url) }
      format.xml  { head :ok }
    end
  end
end

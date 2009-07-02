class RitesPortal::GradeLevelsController < ApplicationController
  # GET /rites_portal_grade_levels
  # GET /rites_portal_grade_levels.xml
  def index
    @rites_portal_grade_levels = RitesPortal::GradeLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_grade_levels }
    end
  end

  # GET /rites_portal_grade_levels/1
  # GET /rites_portal_grade_levels/1.xml
  def show
    @grade_level = RitesPortal::GradeLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grade_level }
    end
  end

  # GET /rites_portal_grade_levels/new
  # GET /rites_portal_grade_levels/new.xml
  def new
    @grade_level = RitesPortal::GradeLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grade_level }
    end
  end

  # GET /rites_portal_grade_levels/1/edit
  def edit
    @grade_level = RitesPortal::GradeLevel.find(params[:id])
  end

  # POST /rites_portal_grade_levels
  # POST /rites_portal_grade_levels.xml
  def create
    @grade_level = RitesPortal::GradeLevel.new(params[:grade_level])

    respond_to do |format|
      if @grade_level.save
        flash[:notice] = 'RitesPortal::GradeLevel was successfully created.'
        format.html { redirect_to(@grade_level) }
        format.xml  { render :xml => @grade_level, :status => :created, :location => @grade_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grade_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_grade_levels/1
  # PUT /rites_portal_grade_levels/1.xml
  def update
    @grade_level = RitesPortal::GradeLevel.find(params[:id])

    respond_to do |format|
      if @grade_level.update_attributes(params[:grade_level])
        flash[:notice] = 'RitesPortal::GradeLevel was successfully updated.'
        format.html { redirect_to(@grade_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grade_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_grade_levels/1
  # DELETE /rites_portal_grade_levels/1.xml
  def destroy
    @grade_level = RitesPortal::GradeLevel.find(params[:id])
    @grade_level.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_grade_levels_url) }
      format.xml  { head :ok }
    end
  end
end

class RitesPortal::ClazzesController < ApplicationController
  # GET /rites_portal_clazzes
  # GET /rites_portal_clazzes.xml
  def index
    @clazzes = RitesPortal::Clazz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clazzes }
    end
  end

  # GET /rites_portal_clazzes/1
  # GET /rites_portal_clazzes/1.xml
  def show
    @clazz = RitesPortal::Clazz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clazz }
    end
  end

  # GET /rites_portal_clazzes/new
  # GET /rites_portal_clazzes/new.xml
  def new
    @clazz = RitesPortal::Clazz.new
    @semesters = RitesPortal::Semester.find(:all)
    if params[:teacher_id]
      @clazz.teacher = RitesPortal::Teacher.find(params[:teacher_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clazz }
    end
  end

  # GET /rites_portal_clazzes/1/edit
  def edit
    @clazz = RitesPortal::Clazz.find(params[:id])
    @semesters = RitesPortal::Semester.find(:all)
  end

  # POST /rites_portal_clazzes
  # POST /rites_portal_clazzes.xml
  def create
    @clazz = RitesPortal::Clazz.new(params[:rites_portal_clazz])
    @semesters = RitesPortal::Semester.find(:all)
    respond_to do |format|
      if @clazz.save
        flash[:notice] = 'RitesPortal::Clazz was successfully created.'
        format.html { redirect_to(@clazz) }
        format.xml  { render :xml => @clazz, :status => :created, :location => @clazz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clazz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_clazzes/1
  # PUT /rites_portal_clazzes/1.xml
  def update
    @clazz = RitesPortal::Clazz.find(params[:id])
    respond_to do |format|
      if @clazz.update_attributes(params[:rites_portal_clazz])
        flash[:notice] = 'RitesPortal::Clazz was successfully updated.'
        format.html { redirect_to(@clazz) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clazz.errors, :status => :unprocessable_entity }
      end
    end
  end  

  # DELETE /rites_portal_clazzes/1
  # DELETE /rites_portal_clazzes/1.xml
  def destroy
    @clazz = RitesPortal::Clazz.find(params[:id])
    @clazz.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_clazzes_url) }
      format.xml  { head :ok }
    end
  end
  
  ## END OF CRUD METHODS
  def edit_offerings
    @clazz = RitesPortal::Clazz.find(params[:id])
  end
  
  def add_offering
    @clazz = RitesPortal::Clazz.find(params[:id])
    dom_id = params[:dragged_dom_id]
    container = params[:dropped_dom_id]
    render :update do |page|
      page << "var container = $('#{container}');"
      page << "var element = $('#{dom_id}');"
      page << "container.insert(element.remove());"
    end
  end
  
  def remove_offering
    @clazz = RitesPortal::Clazz.find(params[:id])
    dom_id = params[:dragged_dom_id]
    container = params[:dropped_dom_id]
    render :update do |page|
      page << "var container = $('#{container}');"
      page << "var element = $('#{dom_id}');"
      page << "container.insert(element.remove());"
    end  
  end
    
end

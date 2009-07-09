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
  
  # HACK:
  # TODO: (IMPORTANT:) This  method is currenlty only for ajax requests, and uses dom_ids 
  # TODO: to infer runnables. Rewrite this, so that the params are less JS/DOM specific..
  def add_offering
    @clazz = RitesPortal::Clazz.find(params[:id])
    dom_id = params[:dragged_dom_id]
    container = params[:dropped_dom_id]
    runnable_id = params[:runnable_id]
    runnable_type = params[:runnable_type].classify
    @offering = RitesPortal::Offering.find_or_create_by_clazz_id_and_runnable_type_and_runnable_id(@clazz.id,runnable_type,runnable_id)
    if @offering
      @offering.save
      @clazz.reload
    end
    render :update do |page|
      page << "var element = $('#{dom_id}');"
      page << "element.remove();"
      page.insert_html :top, container, :partial => 'shared/offering_for_teacher', :locals => {:offering => @offering}
    end
  end
  
  # HACK:
  # TODO: (IMPORTANT:) This  method is currenlty only for ajax requests, and uses dom_ids 
  # TODO: to infer runnables. Rewrite this, so that the params are less JS/DOM specific..
  def remove_offering
    @clazz = RitesPortal::Clazz.find(params[:id])
    dom_id = params[:dragged_dom_id]
    container = params[:dropped_dom_id]
    offering_id = params[:offering_id]
    @offering = RitesPortal::Offering.find(offering_id)
    if @offering
      @runnable = @offering.runnable
      @offering.destroy
      @clazz.reload
    end
    render :update do |page|
      page << "var container = $('#{container}');"
      page << "var element = $('#{dom_id}');"
      page << "element.remove();"
      page.insert_html :top, container, :partial => 'shared/runnable', :locals => {:runnable => @runnable}
    end  
  end
    
end

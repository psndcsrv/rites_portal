class RitesPortal::StudentClazzesController < ApplicationController
  # GET /rites_portal_student_clazzes
  # GET /rites_portal_student_clazzes.xml
  def index
    @rites_portal_student_clazzes = RitesPortal::StudentClazz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_student_clazzes }
    end
  end

  # GET /rites_portal_student_clazzes/1
  # GET /rites_portal_student_clazzes/1.xml
  def show
    @student_clazz = RitesPortal::StudentClazz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_clazz }
    end
  end

  # GET /rites_portal_student_clazzes/new
  # GET /rites_portal_student_clazzes/new.xml
  def new
    @student_clazz = RitesPortal::StudentClazz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_clazz }
    end
  end

  # GET /rites_portal_student_clazzes/1/edit
  def edit
    @student_clazz = RitesPortal::StudentClazz.find(params[:id])
  end

  # POST /rites_portal_student_clazzes
  # POST /rites_portal_student_clazzes.xml
  def create
    @student_clazz = RitesPortal::StudentClazz.new(params[:student_clazz])

    respond_to do |format|
      if @student_clazz.save
        flash[:notice] = 'RitesPortal::StudentClazz was successfully created.'
        format.html { redirect_to(@student_clazz) }
        format.xml  { render :xml => @student_clazz, :status => :created, :location => @student_clazz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_clazz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_student_clazzes/1
  # PUT /rites_portal_student_clazzes/1.xml
  def update
    @student_clazz = RitesPortal::StudentClazz.find(params[:id])

    respond_to do |format|
      if @student_clazz.update_attributes(params[:student_clazz])
        flash[:notice] = 'RitesPortal::StudentClazz was successfully updated.'
        format.html { redirect_to(@student_clazz) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_clazz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_student_clazzes/1
  # DELETE /rites_portal_student_clazzes/1.xml
  def destroy
    @student_clazz = RitesPortal::StudentClazz.find(params[:id])
    @student_clazz.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_student_clazzes_url) }
      format.xml  { head :ok }
    end
  end
end

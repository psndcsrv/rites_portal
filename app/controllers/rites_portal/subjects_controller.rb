class RitesPortal::SubjectsController < ApplicationController
  # GET /rites_portal_subjects
  # GET /rites_portal_subjects.xml
  def index
    @rites_portal_subjects = RitesPortal::Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_subjects }
    end
  end

  # GET /rites_portal_subjects/1
  # GET /rites_portal_subjects/1.xml
  def show
    @subject = RitesPortal::Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /rites_portal_subjects/new
  # GET /rites_portal_subjects/new.xml
  def new
    @subject = RitesPortal::Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /rites_portal_subjects/1/edit
  def edit
    @subject = RitesPortal::Subject.find(params[:id])
  end

  # POST /rites_portal_subjects
  # POST /rites_portal_subjects.xml
  def create
    @subject = RitesPortal::Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        flash[:notice] = 'RitesPortal::Subject was successfully created.'
        format.html { redirect_to(@subject) }
        format.xml  { render :xml => @subject, :status => :created, :location => @subject }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_subjects/1
  # PUT /rites_portal_subjects/1.xml
  def update
    @subject = RitesPortal::Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        flash[:notice] = 'RitesPortal::Subject was successfully updated.'
        format.html { redirect_to(@subject) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_subjects/1
  # DELETE /rites_portal_subjects/1.xml
  def destroy
    @subject = RitesPortal::Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_subjects_url) }
      format.xml  { head :ok }
    end
  end
end

class RitesPortal::LearnersController < ApplicationController
  # GET /rites_portal_learners
  # GET /rites_portal_learners.xml
  def index
    @rites_portal_learners = RitesPortal::Learner.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_learners }
    end
  end

  # GET /rites_portal_learners/1
  # GET /rites_portal_learners/1.xml
  def show
    @learner = RitesPortal::Learner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learner }
    end
  end

  # GET /rites_portal_learners/new
  # GET /rites_portal_learners/new.xml
  def new
    @learner = RitesPortal::Learner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learner }
    end
  end

  # GET /rites_portal_learners/1/edit
  def edit
    @learner = RitesPortal::Learner.find(params[:id])
  end

  # POST /rites_portal_learners
  # POST /rites_portal_learners.xml
  def create
    @learner = RitesPortal::Learner.new(params[:learner])

    respond_to do |format|
      if @learner.save
        flash[:notice] = 'RitesPortal::Learner was successfully created.'
        format.html { redirect_to(@learner) }
        format.xml  { render :xml => @learner, :status => :created, :location => @learner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_learners/1
  # PUT /rites_portal_learners/1.xml
  def update
    @learner = RitesPortal::Learner.find(params[:id])

    respond_to do |format|
      if @learner.update_attributes(params[:learner])
        flash[:notice] = 'RitesPortal::Learner was successfully updated.'
        format.html { redirect_to(@learner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_learners/1
  # DELETE /rites_portal_learners/1.xml
  def destroy
    @learner = RitesPortal::Learner.find(params[:id])
    @learner.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_learners_url) }
      format.xml  { head :ok }
    end
  end
end

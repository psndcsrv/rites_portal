class RitesPortal::OfferingsController < ApplicationController
  # GET /rites_portal_offerings
  # GET /rites_portal_offerings.xml
  def index
    @rites_portal_offerings = RitesPortal::Offering.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_offerings }
    end
  end

  # GET /rites_portal_offerings/1
  # GET /rites_portal_offerings/1.xml
  def show
    @offering = RitesPortal::Offering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offering }
      format.jnlp {
        # check if the user is a student in this offering's class
        # create a learner for the user if it doesnt' exist
        student = current_user.portal_student
        learner = RitesPortal::Learner.find_or_create_by_student_id_and_offering_id(student, @offering)
        
        # render a jnlp for this learner
        render :partial => 'shared/jnlp_for_learner', :locals => {:learner => learner}
      }
    end
  end
  
  # GET /rites_portal_offerings/new
  # GET /rites_portal_offerings/new.xml
  def new
    @offering = RitesPortal::Offering.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offering }
    end
  end

  # GET /rites_portal_offerings/1/edit
  def edit
    @offering = RitesPortal::Offering.find(params[:id])
  end

  # POST /rites_portal_offerings
  # POST /rites_portal_offerings.xml
  def create
    @offering = RitesPortal::Offering.new(params[:offering])

    respond_to do |format|
      if @offering.save
        flash[:notice] = 'RitesPortal::Offering was successfully created.'
        format.html { redirect_to(@offering) }
        format.xml  { render :xml => @offering, :status => :created, :location => @offering }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_offerings/1
  # PUT /rites_portal_offerings/1.xml
  def update
    @offering = RitesPortal::Offering.find(params[:id])

    respond_to do |format|
      if @offering.update_attributes(params[:offering])
        flash[:notice] = 'RitesPortal::Offering was successfully updated.'
        format.html { redirect_to(@offering) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_offerings/1
  # DELETE /rites_portal_offerings/1.xml
  def destroy
    @offering = RitesPortal::Offering.find(params[:id])
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_offerings_url) }
      format.xml  { head :ok }
    end
  end
end

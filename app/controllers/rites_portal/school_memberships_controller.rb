class RitesPortal::SchoolMembershipsController < ApplicationController
  # GET /rites_portal_school_memberships
  # GET /rites_portal_school_memberships.xml
  def index
    @rites_portal_school_memberships = RitesPortal::SchoolMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rites_portal_school_memberships }
    end
  end

  # GET /rites_portal_school_memberships/1
  # GET /rites_portal_school_memberships/1.xml
  def show
    @school_membership = RitesPortal::SchoolMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_membership }
    end
  end

  # GET /rites_portal_school_memberships/new
  # GET /rites_portal_school_memberships/new.xml
  def new
    @school_membership = RitesPortal::SchoolMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_membership }
    end
  end

  # GET /rites_portal_school_memberships/1/edit
  def edit
    @school_membership = RitesPortal::SchoolMembership.find(params[:id])
  end

  # POST /rites_portal_school_memberships
  # POST /rites_portal_school_memberships.xml
  def create
    @school_membership = RitesPortal::SchoolMembership.new(params[:school_membership])

    respond_to do |format|
      if @school_membership.save
        flash[:notice] = 'RitesPortal::SchoolMembership was successfully created.'
        format.html { redirect_to(@school_membership) }
        format.xml  { render :xml => @school_membership, :status => :created, :location => @school_membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_school_memberships/1
  # PUT /rites_portal_school_memberships/1.xml
  def update
    @school_membership = RitesPortal::SchoolMembership.find(params[:id])

    respond_to do |format|
      if @school_membership.update_attributes(params[:school_membership])
        flash[:notice] = 'RitesPortal::SchoolMembership was successfully updated.'
        format.html { redirect_to(@school_membership) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_school_memberships/1
  # DELETE /rites_portal_school_memberships/1.xml
  def destroy
    @school_membership = RitesPortal::SchoolMembership.find(params[:id])
    @school_membership.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_school_memberships_url) }
      format.xml  { head :ok }
    end
  end
end

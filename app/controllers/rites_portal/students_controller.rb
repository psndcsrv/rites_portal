class RitesPortal::StudentsController < ApplicationController
  # GET /rites_portal_students
  # GET /rites_portal_students.xml
  def index
    @students = RitesPortal::Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /rites_portal_students/1
  # GET /rites_portal_students/1.xml
  def show
    @student = RitesPortal::Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /rites_portal_students/new
  # GET /rites_portal_students/new.xml
  def new
    @student = RitesPortal::Student.new
    @user = User.new
    if params[:clazz_id]
      @clazz = RitesPortal::Clazz.find(params[:clazz_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /rites_portal_students/1/edit
  def edit
    @student = RitesPortal::Student.find(params[:id])
    @user = @student.user
  end

  # POST /rites_portal_students
  # POST /rites_portal_students.xml
  def create
    success = false
    begin
      user_params = params[:user]
      user_params[:login] = RitesPortal::Student.generate_user_login(user_params[:first_name], user_params[:last_name])
      user_params[:email] = RitesPortal::Student.generate_user_email
      @user = User.new(user_params)
      # temporarily disable sending email notifications for state change events
      @user.skip_notifications = true
      @user.save!
      @user.register!
      @user.activate!

      student_params = params[:student]
      student_params ||= {}
      student_params[:name] = "#{@user.first_name} #{@user.last_name}"
      student_params[:user_id] = @user.id
      @student = RitesPortal::Student.new(student_params)
      if params[:clazz][:id]
        @clazz = RitesPortal::Clazz.find(params[:clazz][:id])
      end
      
      if params[:clazz][:class_word]
        @clazz = RitesPortal::Clazz.find_by_class_word(params[:clazz][:class_word])
      end
      @student.save!
      
      if @clazz
        @student.student_clazzes.create!(:clazz_id => @clazz.id, :start_time => Time.now)
      end
      
      success = true
    rescue => e
      logger.warn("Failed to create Student: #{e}\n#{e.backtrace.join("\n")}")
    end
    respond_to do |format|
      if success
        flash[:notice] = 'Student was successfully created.'
        if @clazz
          if params[:clazz][:class_word]
            format.html { render 'signup_success' }
          else
            format.html { redirect_to(@clazz) }
          end
        else
          format.html { redirect_to(@student) }
        end
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        if ! @student
          @student = RitesPortal::Student.new
        end
        if params[:clazz][:class_word]
          format.html { render :action => "signup" }
        else
          format.html { render :action => "new" }
        end
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rites_portal_students/1
  # PUT /rites_portal_students/1.xml
  def update
    @student = RitesPortal::Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'RitesPortal::Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rites_portal_students/1
  # DELETE /rites_portal_students/1.xml
  def destroy
    @student = RitesPortal::Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(rites_portal_students_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /rites_portal_students/signup
  # GET /rites_portal_students/signup.xml
  def signup
    @student = RitesPortal::Student.new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end 
end

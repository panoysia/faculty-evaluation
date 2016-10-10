class Admin::Employees::PublicationsController < Admin::ApplicationController

  include CCE::AchievementAndHonor1

  before_action :set_employee
  before_action :set_publication, only: [:edit, :update, :destroy]
  
  layout 'employee_profile'


  def new
    @publication = @employee.publications.new
  end

  def create
    # render html: params.inspect and return true
    @publication = @employee.publications.new(publication_params)
    if @publication.save
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Publication record was successfully created.'
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to referrer,
        notice: 'Publication record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to referrer,
      notice: 'Publication record was successfully deleted.'
  end


  private


  def publication_params
    params.require(:publication).permit(:title, :role, :academic_level,
      :publisher, :date_of_publication, :description)
  end
  
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_publication
    @publication = @employee.publications.find(params[:id])
  end

end
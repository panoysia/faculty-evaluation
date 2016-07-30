class Admin::Employees::PublicationsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @publication = @employee.publications.new
  end

  def create
    render html: params.inspect and return true
    @publication = @employee.publications.new(publication_params)
    if @publication.save
      redirect_to admin_employee_professional_developments_path(
                    anchor: 'publications'),
      notice: 'Publication was successfully created.'
    else
      render :new
    end    
  end

  def show
  end

  def destroy
    @publication.destroy
    redirect_to admin_employee_professional_developments_path(
                  @employee,
                  anchor: 'publications'),
    notice: 'Publication was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_publication
    @publication = @employee.publications.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :nature,
      :role, :academic_level, :publisher, :date_of_publication)
  end

end
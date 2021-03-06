class User::CCERecord::PublicationsController < User::ApplicationController

  before_action :set_employee
  before_action :set_publication, only: [:edit, :update, :destroy]


  def new
    @publication = employee.publications.new
  end

  def create
    @publication = employee.publications.new(publication_params)
    if @publication.save
      redirect_to cce_record_path,
        notice: "Publication record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to cce_record_path,
        notice: "Publication record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to cce_record_path,
      notice: "Publication record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_publication
    @publication = employee.publications.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :role, :academic_level,
      :publisher, :date_of_publication, :description)
  end

end

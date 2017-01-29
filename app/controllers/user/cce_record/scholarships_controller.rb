class User::CCERecord::ScholarshipsController < User::ApplicationController

  before_action :set_employee
  before_action :set_scholarship, only: [:edit, :update, :destroy]


  def new
    @scholarship = employee.scholarships.new
  end

  def create
    @scholarship = employee.scholarships.new(scholarship_params)
    if @scholarship.save
      redirect_to cce_record_path,
        notice: "Scholarship record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scholarship.update(scholarship_params)
      redirect_to cce_record_path,
        notice: "Scholarship record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @scholarship.destroy
    redirect_to cce_record_path,
      notice: "Scholarship record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_scholarship
    @scholarship = @employee.scholarships.find(params[:id])
  end

  def scholarship_params
    params.require(:scholarship).permit(:title, :sponsoring_agency,
                                        :date_granted, :scholarship_type,
                                        :degree_type)
  end

end

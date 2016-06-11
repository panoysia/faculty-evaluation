class Admin::StudentsController < Admin::ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  

  def index
    @students = Student.includes(:department).
                  order('departments.name ASC').
                  references('departments')
  end

  def show
  end

  def new
    @student = Student.new
    @student.build_user_account
  end

  def create
    @student = Student.new(student_params_for_create)
    respond_to do |format|
      if @student.save
        format.html { redirect_to [:admin, @student], notice: 'Student was successfully created.' }
      else
        @student.build_user_account
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @student.update(student_params_for_update)
        format.html { redirect_to [:admin, @student], notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admin_students_path, notice: 'Student was successfully deleted.' }
    end
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params_for_update
    params.require(:student).permit(:first_name, :last_name, :department_id)    
  end

  def student_params_for_create
    params.require(:student).permit(:first_name, :last_name, :department_id, user_account_attributes: [:username, :password])
  end

end
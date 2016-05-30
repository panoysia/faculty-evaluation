class User::QCEs::StudentInstructionRatingsController < User::ApplicationController

  EVALUATION_CONTEXT = 'Student'
  NUMBER_OF_STUDENTS = 30
  
  before_action :set_qce


  def create
    # No validation needed, all we need to do is retrieve the ids of 30 Student records so that we can use them as objects.
    student_ids = Student.ids.sample(NUMBER_OF_STUDENTS)
    students = Student.find(student_ids)

    students.each do |student|
      rating = QCE::Instruction.new
      rating.qce_id = @qce.id
      rating.evaluator = student
      rating.evaluator_name = student.full_name
      # rating.evaluator_position = employee.rank.full_name
      rating.evaluation_context = EVALUATION_CONTEXT
      rating.save
    end

    respond_to do |format|
      @qce.update(has_assigned_student_rating: 1)
      format.html { redirect_to edit_qce_path(@qce), notice: 'Instruction ratings for 30 students have been created.'}
    end

  end   # create

  def destroy
    if @qce.student_instruction_ratings.present?
      @qce.student_instruction_ratings.destroy_all
      @qce.update(has_assigned_student_rating: 0)
      
      redirect_to edit_qce_path(@qce), notice: 'Instruction ratings for 30 students have been deleted.'
    end    
  end

  
  private

  def set_qce
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::StudentInstructionRatingsController

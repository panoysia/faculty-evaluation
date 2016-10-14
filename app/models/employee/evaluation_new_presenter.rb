class Employee::EvaluationNewPresenter < Employee::EvaluationPresenter

  def initialize(evaluation)
    super(evaluation)
    @cce_record = Employee::CCERecord.new(employee)
  end

end



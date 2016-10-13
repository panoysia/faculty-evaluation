class Employee::UnrecordedCCERecord < Employee::CCERecord

  def initialize(employee)
    super
    @cce_scorings = @employee.cce_scorings.unrecorded
  end

end
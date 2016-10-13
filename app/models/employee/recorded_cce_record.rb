class Employee::RecordedCCERecord < Employee::CCERecord

  def initialize(employee)
    super
    @cce_scorings = @employee.cce_scorings.recorded
  end

end
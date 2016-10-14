class Employee::RecordedCCERecord < Employee::CCERecord

  def initialize(employee, nbc_id)
    super(employee)
    @cce_scorings = @employee.cce_scorings.recorded.with_nbc(nbc_id)
  end

end
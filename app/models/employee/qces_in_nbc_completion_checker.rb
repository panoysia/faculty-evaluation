class Employee::QCEsInNBCCompletionChecker
  NUMBER_OF_RATING_PERIODS_PER_NBC = 6

  attr_accessor :employee, :nbc

  def initialize(employee, nbc)
    @employee = employee
    @nbc = nbc
  end

  def valid?
    ids = nbc.rating_periods.ids    
    qce = employee.qces.where(rating_period: ids, completed: true)
    
    (qce.count == NUMBER_OF_RATING_PERIODS_PER_NBC)
  end

  def valid_rating_periods_count
    ids = nbc.rating_periods.ids
    qce = employee.qces.where(rating_period: ids, completed: true)
    qce.try(:count)
  end

end
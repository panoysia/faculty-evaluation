class Evaluation::EmployeeQCEsInNBCQuery

  def initialize(employee, nbc)
    @employee = employee
    @nbc = nbc
  end
  
  def relation
    criteria =<<-SQL
      academic_years.start_at ASC,
      academic_years.end_at ASC,
      rating_periods.semester ASC
    SQL

    @employee.qces.joins(rating_period: :academic_year).
      where("academic_years.nbc_id = ?", @nbc.id).
      order(criteria).
      merge(QCE.completed).
      includes(rating_period: :academic_year)
  end

  # query = Evaluation::EmployeeQCEsInNBCQuery.
  #         new(evaluation.employee, evaluation.nbc)

  # query.relation.collect { |qce| Evaluation::QCESummarizer.new(qce) }

end

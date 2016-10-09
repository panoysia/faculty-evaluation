require "delegate"

class Employee::EvaluationPresenter < SimpleDelegator
  delegate :id, :full_name, :cce_scorings, 
            to: :employee,
            allow_nil: true, prefix: true

  delegate :id, :name,
            to: :nbc,
            prefix: true


  def initialize(evaluation)
    @evaluation = evaluation
    @employee = evaluation.employee
    @nbc = evaluation.nbc
    # @cce_record = Employee::CCERecord.new(@employee)
    super(evaluation)
  end
  
  def cce_score
    return self[:cce_score] if evaluated?
    204
  end

  def cce_scorings
    employee.cce_scorings.where("nbc_id <= ?", nbc_id)
  end

  def current_rank
    # return rank_after if evaluated?
    employee.rank.full_name
  end

  def evaluated?
    persisted?
  end

  # def nbc_name
  #   nbc.name
  # end

  def qce_status
    # 
  end

  def status
    if evaluated?
      "Evaluated and recorded"
    else
      "Not yet initiated"
    end
  end

  def to_s
    "Evaluation of #{employee_full_name} for NBC #{nbc_name}"
  end


  private

  attr_reader :evaluation, :employee, :nbc

end

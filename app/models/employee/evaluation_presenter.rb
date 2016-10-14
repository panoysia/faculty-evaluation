require "delegate"

class Employee::EvaluationPresenter < SimpleDelegator
  delegate :id, :full_name,
            to: :employee,
            allow_nil: true, prefix: true

  delegate :id, :name,
            to: :nbc,
            allow_nil: true, prefix: true

  attr_reader :cce_record

  
  def initialize(evaluation)
    # @employee = evaluation.employee
    # @nbc = evaluation.nbc
    super(evaluation)
    @evaluation = evaluation
    @cce_record = Employee::RecordedCCERecord.new(employee, nbc_id)
  end
  

# class Employee::QCEsInNBC
#   attr_reader :employee

#   def initialize(employee, nbc)
#     @employee = employee
#   end
# end


  # def qces
  #   @qces || Employee::QCEsInNBC(employee, )
  # end


  def ninja_employee
    employee
  end

  def ninja_nbc
    nbc
  end


  # def cce_score
  #   return self[:cce_score] if evaluated?
  #   204
  # end

  # def cce_scorings
  #   employee.cce_scorings.where("nbc_id <= ?", nbc_id)
  # end

  # def nbc_name
  #   nbc.name
  # end


  def current_rank
    # return rank_after if evaluated?
    employee.rank.full_name
  end

  def evaluated?
    persisted?
  end

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

  attr_reader :evaluation #, :employee, :nbc

end

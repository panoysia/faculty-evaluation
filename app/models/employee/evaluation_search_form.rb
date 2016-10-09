class Employee::EvaluationSearchForm
  include ActiveModel::Model

  attr_accessor :employee_id, :nbc_id

  validates :employee_id, :nbc_id,
    presence: true,
    numericality: { message: "is invalid" }


  def self.model_name
    ActiveModel::Name.new(self, nil, "search")
  end

  def results
    evaluation = Employee::Evaluation.find_or_initialize_by(employee_id_and_nbc_id)

    Employee::EvaluationPresenter.new(evaluation)
  end


  private


  def employee_id_and_nbc_id
    { employee_id: employee_id, nbc_id: nbc_id }
  end

end

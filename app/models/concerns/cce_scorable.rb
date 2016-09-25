module CCEScorable
  extend ActiveSupport::Concern

  included do
    belongs_to :employee, required: true
    
    has_one :cce_scoring, as: :cce_scorable,
                          class_name: Employee::CCEScoring,
                          dependent: :destroy
  end

end

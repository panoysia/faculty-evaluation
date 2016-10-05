# == Schema Information
#
# Table name: employee_cce_scorings
#
#  id                     :integer          not null, primary key
#  employee_id            :integer          not null
#  cce_scorable_id        :integer          not null
#  cce_scorable_type      :string           not null
#  nbc_id                 :integer
#  points                 :decimal(5, 2)    not null
#  supporting_description :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  idx_cce_scorable_on_employee_cce_scorings  (cce_scorable_type,cce_scorable_id)
#  idx_employee_id_on_employee_cce_scorings   (employee_id)
#  idx_nbc_id_on_employee_cce_scorings        (nbc_id)
#

require_dependency "employee/application_record"

class Employee::CCEScoring < Employee::ApplicationRecord
  include CCEConstants::CCEScoring

  belongs_to :cce_scorable, polymorphic: true
  belongs_to :employee
  belongs_to :nbc
  
  delegate :id, :name, to: :nbc, allow_nil: true, prefix: true

  scope :educations, -> { where(cce_scorable_type: EDUCATIONS) }
  scope :work_experiences, -> { 
    where(cce_scorable_type: WORK_EXPERIENCES) 
  }
  scope :achievements, -> { where(cce_scorable_type: ACHIEVEMENTS) }


  def recorded?
    nbc_id.present?
  end

  # def nbc_recorded?
  #   nbc_id.present?
  # end

end

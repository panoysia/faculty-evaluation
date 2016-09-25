# == Schema Information
#
# Table name: employee_professional_memberships
#
#  id                 :integer          not null, primary key
#  employee_id        :integer          not null
#  organization       :string(150)      not null
#  date_of_membership :date             not null
#  organization_type  :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  membership_type    :integer
#
# Indexes
#
#  index_employee_professional_memberships_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalMembership < Employee::ApplicationRecord
  include CCEConstants::ProfessionalMembership
  include CCEScorable
  
  validates :organization, presence: true
  validates :date_of_membership, presence: true

  validates :organization_type, inclusion: { 
    in: ORGANIZATION_TYPES.each_index.map { |index| index }
  }

  validates :membership_type, inclusion: { 
    in: MEMBERSHIP_TYPES.each_index.map { |index| index }
  }  

  validate :learned_society_membership,
    if: Proc.new { |rec | rec.organization_type == LEARNED_SOCIETY }

  validate :professional_society_membership,
    if: Proc.new { |rec| rec.organization_type == PROFESSIONAL_SOCIETY }

  after_save :create_or_update_cce_scoring_record


  def self.organization_type_options
    ORGANIZATION_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.membership_type_options
    MEMBERSHIP_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def organization_type_to_string
    ORGANIZATION_TYPES[organization_type]
  end

  def membership_type_to_string
    MEMBERSHIP_TYPES[membership_type]
  end


  private


  def learned_society_membership
    error_message = "For a Learned society organization, valid values for [Membership] type criteria are: Full member or Associate member."

    unless membership_type.in? [FULL_MEMBER, ASSOCIATE_MEMBER]
      errors[:base] << error_message
    end
  end

  def professional_society_membership
    error_message = "For a Professional society organization, valid values for [Membership] type criteria are: Officer or Member."
    
    unless membership_type.in? [OFFICER, MEMBER]
      errors[:base] << error_message
    end
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::ProfessionalMembership.score(self)
    scoring.save
    # scoring.supporting_description = "professional membership desc"
  end

end

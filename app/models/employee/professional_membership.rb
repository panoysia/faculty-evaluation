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

class Employee::ProfessionalMembership < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  ORGANIZATION_TYPES = [
    'Learned Society',
    'Honor Society',
    'Scientific Society',
    'Professional'
  ]

  MEMBERSHIP_TYPES = [
    'Full member',
    'Associate member',
    'Officer',
    'Member'
  ]

  belongs_to :employee

  validates :organization, presence: true
  validates :date_of_membership, presence: true

  validates :organization_type, inclusion: { 
    in: ORGANIZATION_TYPES.each_index.map { |index| index }
  }

  validates :membership_type, inclusion: { 
    in: MEMBERSHIP_TYPES.each_index.map { |index| index }
  }  
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

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

end

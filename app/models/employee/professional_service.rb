# == Schema Information
#
# Table name: employee_professional_services
#
#  id                      :integer          not null, primary key
#  employee_id             :integer          not null
#  title                   :string(150)
#  service_type            :integer          not null
#  level                   :integer          not null
#  nature_of_participation :string(150)      default(""), not null
#  sponsoring_agency       :string(150)      not null
#  start_at                :date             not null
#  end_at                  :date             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_employee_professional_services_on_employee_id  (employee_id)
#

class Employee::ProfessionalService < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  LEVELS = [
    'International',
    'National/Regional',
    'Local/Institutional'
  ]
  
  SERVICE_TYPES = [
    'Consultant',
    'Trainer',
    'Coordinator',
    'Lecturer',
    'Resource Person',
    'Guest Speaker'
  ]

  belongs_to :employee

  validates :title, :sponsoring_agency,
    presence: true, length: { maximum: 150 }
  
  validates :nature_of_participation, length: { maximum: 150 }
  validates :start_at, :end_at,
    presence: true

  validates :service_type, inclusion: { 
    in: SERVICE_TYPES.each_index.map { |index| index }
  }
  
  validates :level, inclusion: { 
    in: LEVELS.each_index.map { |index| index }
  }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.service_type_options
    SERVICE_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.level_options
    LEVELS.each_with_index.map { |type, index| [type, index] }
  end


  def service_type_to_string
    SERVICE_TYPES[service_type]
  end

  def level_to_string
    LEVELS[level]
  end

end

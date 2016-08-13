# == Schema Information
#
# Table name: employee_community_outreaches
#
#  id                :integer          not null, primary key
#  project_name      :string(150)      not null
#  sponsoring_agency :string(150)      not null
#  start_at          :date             not null
#  end_at            :date             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :integer          not null
#
# Indexes
#
#  index_employee_community_outreaches_on_employee_id  (employee_id)
#

class Employee::CommunityOutreach < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee

  validates :project_name, presence: true, length: { maximum: 150 }
  validates :sponsoring_agency, presence: true, length: { maximum: 150 }
  validates :start_at, :end_at, presence: true

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end

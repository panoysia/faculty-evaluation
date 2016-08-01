class Employee::DiscoveryCriterium < ActiveRecord::Base
  # self.table_name_prefix = 'employee_'
  self.table_name = 'discovery_criteria'

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  # def self.use_relative_model_naming?
  #   true
  # end

end

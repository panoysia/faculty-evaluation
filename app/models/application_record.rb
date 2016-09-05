class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # Use this for resolving namespaced models in polymorphic route generation and when preferring to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end

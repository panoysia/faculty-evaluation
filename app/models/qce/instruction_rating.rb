class QCE::InstructionRating < ActiveRecord::Base
  self.table_name_prefix = 'qce_'
  
  belongs_to :qce

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

end

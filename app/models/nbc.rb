class NBC < ActiveRecord::Base
  
  has_many :rankings, class_name: 'Employee::Ranking'

  scope :current, -> { where(is_current: 1).limit(1) }

  validates :name, presence: true
  # Add unique index to the :is_current field
      # -> validate it also  

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end
    
end
class Leave < ActiveRecord::Base
  # Prefer the use of words 'category'/'context' over the word 'type' as column name. 'Type' is more of a reserved word and used internally by Rails for models using Single Table Inheritance.
  CATEGORIES = { 
      Sick: 'S', 
      Vacation: 'V', 
      Maternity: 'M'
    }
  
  MAXIMUM = 15

  belongs_to :employee

  validates_presence_of :filed_at, :start_at, :end_at, :employee
  validate :correct_date_range, unless: :date_values_are_nil?
  #  unless: Proc.new { (start_at.nil? && end_at.nil?) }
  
  before_save :compute_length_of_leave


  def self.remaining(id) 
    MAXIMUM - where(employee_id: id).sum(:length)
  end


  private

  def date_values_are_nil?
    start_at.nil? && end_at.nil?
  end

  def correct_date_range
    unless end_at > start_at
      errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
    end
  end

  def compute_length_of_leave
    self[:length] = (end_at - start_at).to_i
    puts "computing length of leave...."
  end

end
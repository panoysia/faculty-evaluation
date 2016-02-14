class Leave < ActiveRecord::Base
  # TODO: Change 'category' column to 'type' column so that STI can be use for different types of leaves
  
  CATEGORIES = { Sick: 0, Vacation: 2, Others: 2 }
  MAXIMUM = 15

  belongs_to :employee

  validates_presence_of :filed_at, :start_at, :end_at, :employee
  validate :correct_date_range, unless: :date_values_are_nil?
  #  unless: Proc.new { (start_at.nil? && end_at.nil?) }
  
  before_save :compute_length_of_leave


  # def self.remaining(id) 
  #   15 - where(employee_id: id).sum(:length)
  # end 

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
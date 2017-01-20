# == Schema Information
#
# Table name: leaves
#
#  id               :integer          not null, primary key
#  filed_at         :date             not null
#  start_at         :date             not null
#  end_at           :date             not null
#  length           :integer          not null
#  employee_id      :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  academic_year_id :integer
#
# Indexes
#
#  index_leaves_on_academic_year_id  (academic_year_id)
#  index_leaves_on_employee_id       (employee_id)
#

class Leave < ActiveRecord::Base  
  # Prefer the use of words 'category'/'context' over the word 'type' as column name. 'Type' is more of a reserved word and used internally by Rails for models using Single Table Inheritance.
  CATEGORIES = { 
      Sick: 'S', 
      Vacation: 'V', 
      Maternity: 'M'
    }

  MAX_DAYS_ALLOWED = 15

  belongs_to :employee
  belongs_to :academic_year

  scope :latest, -> (size = 8) { order(filed_at: :desc).limit(size) }

  validates :filed_at, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :employee, presence: true
  validates :academic_year, presence: true

  # 1 - ensure employee has remaining credits to file for leave
  # 2 - ensure date of leave is between the academic_year period

  validate :correct_date_range, unless: :date_values_are_nil?
  #  unless: Proc.new { (start_at.nil? && end_at.nil?) }
  
  before_save :compute_length_of_leave


  def self.total(employee_id, academic_year_id)
  end

  def self.remaining(employee_id, academic_year_id)
    service_credits = LeaveServiceCredit.where(employee_id: employee_id, academic_year_id: academic_year_id).sum(:no_of_days)

    total_leave_credits = MAXIMUM + service_credits
    total_leave_credits - where(employee_id: employee_id, academic_year_id: academic_year_id).sum(:length)
  end


  private

  def date_values_are_nil?
    start_at.nil? && end_at.nil?
  end

  def correct_date_range
    unless end_at >= start_at
      errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
    end
  end

  def compute_length_of_leave
    length = ((end_at - start_at).to_i) + 1
    weekend_count = 0

    # Saturday and Sunday are non-working days
    (start_at..end_at).each do |date|
      if date.saturday? || date.sunday?
        # puts "#{date} is a #{date.strftime '%A, %b %d'}"
        weekend_count += 1
      end
    end

    # Our query will consider only holidays that doesn't fall
    # on a weekend (Saturday and Sunday) or non-working day
    criteria = "((occurs_at >= :start_at) AND (occurs_at <= :end_at)) AND (is_weekend <> 1)"
    holiday_count = Holiday.where(criteria, start_at: start_at, end_at: end_at).count

    length -= (weekend_count + holiday_count)
    self[:length] = length
  end   # compute_length_of_leave

end

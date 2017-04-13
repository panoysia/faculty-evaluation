# == Schema Information
#
# Table name: nbcs
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default(1), not null
#

class NBC < ActiveRecord::Base
  CLOSE = 0
  OPEN = 1

  has_many :rankings, class_name: 'Employee::Ranking'
  
  # 3 Academic Years per NBC record
  has_many :academic_years, dependent: :destroy
  has_many :rating_periods, through: :academic_years

  accepts_nested_attributes_for :academic_years
  enum status: { close: CLOSE, open: OPEN }

  validates :name, presence: true


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.valid
    select(&:has_academic_years?)
  end


  def has_academic_years?
    academic_years.count > 0
  end

  def name_with_academic_years
    years = academic_years.
              map { |record| record.start_at.year }.
              sort.join(", ")

    "#{name} (years #{years})"
  end

end

# reject_if: lambda { |attributes| attributes['username'].blank? && attributes['password'].blank? }

#  scope :current, -> { where(is_current: 1).limit(1) }

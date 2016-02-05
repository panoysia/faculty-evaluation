module Admin::RatingPeriodsHelper

  def convert_semester(value)
    RatingPeriod::SEMESTERS[value.to_sym]
  end
end
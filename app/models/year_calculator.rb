class YearCalculator
  # TODO:
  #
  # This class needs more improvement when handling edge cases like:
  #
  #   If :date_end is lower than :date_start, then a negative
  #     value is returned
  #

  def self.calculate(date_start, date_end)
    date_start = 0 if date_start.nil?
    date_end = 0 if date_end.nil?

    year_difference = (date_end.year - date_start.year)
    
    year_difference - ((date_end.month > date_start.month || (date_end.month == date_start.month && date_end.day >= date_start.day)) ? 0 : 1)
  end

end
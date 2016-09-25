class CorrectDateRangeValidator
  attr_reader :record, :start_date_field, :end_date_field

  def initialize(record, fields)
    @record = record
    @start_date_field = fields.first
    @end_date_field = fields.last
  end

  def validate
    if both_dates_present?
      if record.send(start_date_field) > record.send(end_date_field)
        start_date_name = start_date_field.to_s.titleize
        end_date_name = end_date_field.to_s.titleize

        record.errors[:base] << "Invalid date range.\n[#{start_date_name}] date value must not be greater than [#{end_date_name}] date value."
      end
    end
  end


  private


  def both_dates_present?
    record.send(start_date_field).present? && 
      record.send(end_date_field).present?
  end

  def record
    @record
  end

end
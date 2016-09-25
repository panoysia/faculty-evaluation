=begin
check:   :start_at, :end_at; (1.00) per year
          :years_of_service
=end

module CCEScorer
  class AccreditationService

    GIVEN_MAX_POINTS = 1

    def self.score(record)
      record.years_of_service * GIVEN_MAX_POINTS
    end

  end
end

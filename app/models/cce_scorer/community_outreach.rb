=begin
(max 5 pts.)
  check: :start_at and :end_at 
  (for every year of participation in service)
=end

module CCEScorer
  class CommunityOutreach

    GIVEN_MAX_POINTS = 1

    def self.score(record)
      record.years_of_participation * GIVEN_MAX_POINTS
    end

  end
end

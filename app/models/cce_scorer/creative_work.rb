=begin
  # check: :criteria association and :competitiveness
=end

module CCEScorer
  class CreativeWork
    include CCEConstants::CreativeWork

    GIVEN_BASE_PCT = 0.25
    

    def self.score(record)
      return 0 if record.criteria.blank?

      count = record.criteria.count
      
      point_scale = case record.competitiveness
                    when INTERNATIONAL then POINTS_FOR_INTERNATIONAL
                    when NATIONAL_OR_REGIONAL then POINTS_FOR_NATIONAL
                    when INSTITUTIONAL_OR_LOCAL then POINTS_FOR_LOCAL
                    else 0
                    end

      points = (GIVEN_BASE_PCT * point_scale) * count
    end

  end   # CreativeWork
end   # CCEScorer

=begin
  # ORIGINALITY = 1
  # ACCEPTABILITY_AND_RECOGNITION = 2
  # RELEVANCE_AND_VALUE = 3
  # DOCUMENTATION = 4
=end

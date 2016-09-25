=begin
  Check for :criteria:
    * Originality, educational impact, documentation = 60% of 7 (.6 x 7)
    * Evidence of wide dissemination = 40% of 7 (.4 x 7)
=end

module CCEScorer
  class Discovery
    
    # Constants here match the commented criteria guide found above.
    ORIGINALITY = 1
    EVIDENCE_OF_WIDE_DISSEMINATION = 2
    
    GIVEN_MAX_POINTS = 7

    ORIGINALITY_PCT = 0.60
    EVIDENCE_OF_WIDE_DISSEMINATION_PCT = 0.40

    def self.score(record)
      return 0 if record.criteria.blank?

      criteria = record.criteria.pluck(:criteria)
      points = 0

      if criteria.include? ORIGINALITY
        points += GIVEN_MAX_POINTS * ORIGINALITY_PCT
      end

      if criteria.include? EVIDENCE_OF_WIDE_DISSEMINATION
        points += GIVEN_MAX_POINTS * EVIDENCE_OF_WIDE_DISSEMINATION_PCT
      end

      points
    end

  end   # class Discovery
end   # module CCEScorer

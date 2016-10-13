=begin

1.2 Additional equivalent degree earned related to present position
      Masters         4
      Bachelors       3

=end

module CCEScorer
  class AdditionalDegree
    include CCEConstants::AdditionalDegree

    def self.score(record)
      if record.degree_type == MASTERS
        PTS_FOR_MASTERS
      elsif record.degree_type == BACHELORS
        PTS_FOR_BACHELORS
      else
        0
      end
    end

  end   # class AdditionalDegree
end   # module CCEScorer

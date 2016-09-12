=begin

1.2 Additional equivalent degree earned related to present position
      Masters         4
      Bachelors       3

    * check :degree_type field
=end

module CCEScorer
  class AdditionalDegree
    include CCEConstants::AdditionalDegree

    def self.score(record)
      if record.degree_type == MASTERS
        4.0
      elsif record.degree_type == BACHELORS
        3.0
      end
    end

  end   # class AdditionalDegree
end   # module CCEScorer

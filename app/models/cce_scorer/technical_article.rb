=begin
  # check: :level
=end

module CCEScorer
  class TechnicalArticle
    include CCEConstants::TechnicalArticle
    
    def self.score(record)

      points =  case record.level
                when INTERNATIONAL then 5
                when NATIONAL then 3
                when LOCAL then 2
                else 0
                end

    end

  end
end

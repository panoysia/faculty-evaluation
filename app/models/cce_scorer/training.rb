=begin
  (max 10 pts.)
  check: :level and :category
=end

module CCEScorer
  class Training
    include CCEConstants::Training

    FIVE_WORKING_DAYS = 5
    
    def self.score(record)

      # The arrays below represents the scoring table
      #   for the types of training (training or seminar):
      #
      #   1st element represents the score for INTERNATIONAL level
      #   2nd element represents NATIONAL or REGIONAL level
      #   3rd element represents LOCAL level
      training  = [5, 3, 2]
      seminar   = [0.6, 0.4, 0.2]
    
      if record.category == TRAINING
        # Assumes that the record has at least a value
        #   of 30 (days training) in its :no_of_days field.
        training[record.level]
      
      elsif record.category == SEMINAR_OR_CONFERENCE
        point_per_day = seminar[record.level]
        no_of_days = record.no_of_days

        if no_of_days > FIVE_WORKING_DAYS
          no_of_days = FIVE_WORKING_DAYS
        end

        no_of_days * point_per_day
      else
        0
      end
    end
    
  end
end

=begin

  # checks: :role and :academic_level

=end

module CCEScorer
  class Publication
    include CCEConstants::Publication

    def self.score(record)
      # An array is provided for each role. Each value in the array
      #  represents the value/weight for the type of academic level
      #  selected.
      #
      # First value is for "Tertiary", then "High School",
      #   and "Elementary".
      #
      # For the "author" role, Tertiary is 7, 5 for High School,
      #  and 3 for Elementary.

      author        = [7, 5, 3]
      reviewer      = [4, 2, 1]
      translator    = [4, 2, 1]
      editor        = [3, 2, 1]
      compiler      = [2, 1, 1]

      score_table = {
        author: author,
        reviewer: reviewer,
        translator: translator,
        editor: editor,
        compiler: compiler
      }

      level = record.academic_level

      points =  case record.role
                when AUTHOR then score_table[:author][level]
                when REVIEWER then score_table[:reviewer][level]
                when TRANSLATOR then score_table[:translator][level]
                when EDITOR then score_table[:editor][level]
                when COMPILER then score_table[:compiler][level]
                else 0
                end
    end   # def self.score(record)
    
  end   # class Publication
end   # module CCEScorer

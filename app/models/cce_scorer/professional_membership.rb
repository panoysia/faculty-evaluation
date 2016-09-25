=begin
  check: :organization_type and :membership_type
=end

module CCEScorer
  class ProfessionalMembership
    include CCEConstants::ProfessionalMembership

    def self.score(record)
      
      member_type = record.membership_type

      points =  case record.organization_type
                when LEARNED_SOCIETY
                  if member_type == FULL_MEMBER
                    2
                  elsif member_type == ASSOCIATE_MEMBER
                    1
                  else
                    0
                  end

                when HONOR_SOCIETY, SCIENTIFIC_SOCIETY then 1.0

                when PROFESSIONAL_SOCIETY
                  if member_type == OFFICER
                    1.0
                  elsif member_type == MEMBER
                    0.5
                  else
                    0
                  end
                end

    end   # def self.score

  end   # class ProfessionalMembership
end   # module CCEScorer

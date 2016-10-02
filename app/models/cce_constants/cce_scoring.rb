module CCEConstants
  module CCEScoring
    EDUCATIONS = [ 
      Employee::AcademicDegree, 
      Employee::AdditionalCredit,
      Employee::AdditionalDegree
    ]

    WORK_EXPERIENCES = [
      Employee::AcademicWorkExperience,
      Employee::AdminWorkExperience,
      Employee::ProfessionalWorkExperience,
      Employee::PublicPrivateWorkExperience
    ]

    HONORS_1 = [
      Employee::Training,
      Employee::CreativeWork,
      Employee::Discovery,
      Employee::Innovation,
      Employee::InstructionalManual,
      Employee::Invention,
      Employee::Publication,
      Employee::TechnicalArticle
    ]

    HONORS_2 = [
      Employee::AcademicHonor,
      Employee::Award,
      Employee::CommunityOutreach,
      Employee::ProfessionalExamination,
      Employee::ProfessionalMembership,
      Employee::Scholarship
    ]

    EXPERT_SERVICES = [
      Employee::AcademicAdvisory,
      Employee::AccreditationService,
      Employee::AssessorService,
      Employee::ProfessionalReview,
      Employee::ProfessionalService,
      Employee::TrainerService,
    ]
    
    ACHIEVEMENTS = [*HONORS_1, *HONORS_2, *EXPERT_SERVICES]
  end  
end

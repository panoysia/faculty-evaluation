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
      Employee::Invention,
      Employee::Discovery,
      Employee::CreativeWork,
      Employee::Innovation,
      Employee::Publication,
      Employee::TechnicalArticle,
      Employee::InstructionalManual
    ]

    HONORS_2 = [
      Employee::ProfessionalMembership,
      Employee::AcademicHonor,
      Employee::Scholarship,
      Employee::Award,
      Employee::CommunityOutreach,
      Employee::ProfessionalExamination
    ]

    EXPERT_SERVICES = [
      Employee::ConsultancyService,
      Employee::ProfessionalService,
      Employee::AcademicAdvisory,
      Employee::ProfessionalReview,
      Employee::AccreditationService,
      Employee::AssessorService,
      Employee::TrainerService
    ]

    ACHIEVEMENTS = [*HONORS_1, *HONORS_2, *EXPERT_SERVICES]
  end  
end

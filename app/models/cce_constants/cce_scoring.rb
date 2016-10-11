module CCEConstants
  module CCEScoring

    CREATIVE_WORKS = [
      Employee::Invention,
      Employee::Discovery,
      Employee::CreativeWork,
      Employee::Innovation,
      Employee::Publication,
      Employee::TechnicalArticle,
      Employee::InstructionalManual
    ]

    HONORS = [
      Employee::ProfessionalMembership,
      Employee::AcademicHonor,
      Employee::Scholarship,
      Employee::Award,
      Employee::CommunityOutreach,
      Employee::ProfessionalExamination
    ]

    EXPERT_SERVICES_RENDERED = [
      Employee::ConsultancyService,
      Employee::ProfessionalService,
      Employee::AcademicAdvisory,
      Employee::ProfessionalReview,
      Employee::AccreditationService,
      Employee::AssessorService,
      Employee::TrainerService      
    ]

    EXPERT_SERVICES = EXPERT_SERVICES_RENDERED + [Employee::Training]

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
    
    ACHIEVEMENTS = [*CREATIVE_WORKS, *HONORS, *EXPERT_SERVICES]
  end  
end

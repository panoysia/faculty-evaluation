# criteria is { 1: education, 2: experience, 3: profdev }
#   education   = 85
#   experience  = 25
#   profdev     = 90
#     Total = 200
=begin

# area/context/category/criteria:
  1 is for education
  2 is for experience
  3 is for profdev
  
=end

1.upto(100).each do |num|
  first_name = "client#{num}"
  last_name = "lastname#{num}"
  description = "description#{num}"
  c = Client.create first_name: first_name,
                    last_name: last_name,
                    description: description
  c.build_user_account username: first_name, password: 'password'
  c.save
end

exit


CCE::ScoringGuide.create [
  {
    description: '',
    criteria: 2,
    points: 0
  }
]

# Point system for Educational Qualification

CCE::ScoringGuide.create [
  {
    description: 'Doctorate',
    criteria: 1,
    points: 85
  },

  {
    description: "Master's Degree",
    criteria: 1, 
    points: 65
  },

  {
    description: "LLB / MD",
    criteria: 1,
    points: 65
  },

  {
    description: "Diploma Course",
    criteria: 1,
    points: 55
  },

  {
    description: "Bachelor's Degree (4 years)",
    criteria: 1,
    points: 45
  },

  {
    description: "3-years post secondary course",
    criteria: 1,
    points: 30
  },  

  {
    description: "Special Course (Non-degree)",
    criteria: 1,
    points: 25
  }
]

exit

# Point system for Experience and Length of Service

CCE::ScoringGuid.create [
  {
    description: 'Doctorate',
    criteria: 1,
    points: 85
  },

  {
    description: "Master's Degree",
    criteria: 1, 
    points: 65
  },

  {
    description: "LLB / MD",
    criteria: 1,
    points: 65
  },

  {
    description: "Diploma Course",
    criteria: 1,
    points: 55
  }

]


exit


# Run: rake db:seed / rake db:setup
=begin

  RatingType: Instruction, Research, Extension, Production
  Instrument: Instruction
    * Commitment
    * Knowledge of Subject
    * Teaching for Independent Learning
    * Management of Learning

  Instrument: (Research, Extension, Production)
    * Clientele Satisfaction
    * Leadership
    * Partnership Development
    * Community Responsibility
=end 
# Instruction - Commitment

QCE::Question.create [
    {
      question: 'Demonstrates sensitivity to students\' ability to attend and absorb content information.',
      sequence: 1,
      rating_type: 'Instruction',
      instrument: 'Commitment'
    },

    {
      question: 'Integrates sensitively his/her learning objectives with those of the students in a collaborative process.',
      sequence: 2,
      rating_type: 'Instruction',
      instrument: 'Commitment'
    },

    {
      question: 'Makes self available to students beyond official time.',
      sequence: 3,
      rating_type: 'Instruction',
      instrument: 'Commitment'
    },

    {
      question: 'Regularly comes to class on time, well-groomed and well-prepared to complete assigned responsibilities.',
      sequence: 4,
      rating_type: 'Instruction',
      instrument: 'Commitment'
    },

    {
      question: 'Keeps accurate records of students\' performance and prompt submission of the same.',
      sequence: 5,
      rating_type: 'Instruction',
      instrument: 'Commitment'
    }            

]

# Instruction - Knowledge of Subject
QCE::Question.create [
    {
      question: 'Demonstrates mastery of the subject matter (explain the subject matter without relying solely on the prescribed textbook).',
      sequence: 1,
      rating_type: 'Instruction',
      instrument: 'Knowledge of Subject'
    },

    {
      question: 'Draws and share information on the state of the art of theory and practice in his/her discipline.',
      sequence: 2,
      rating_type: 'Instruction',
      instrument: 'Knowledge of Subject'
    },

    {
      question: 'Integrates subject to practical circumstances and learning intents/purposes of students.',
      sequence: 3,
      rating_type: 'Instruction',
      instrument: 'Knowledge of Subject'
    },

    {
      question: 'Explains the relevance of present topics to the previous lessons, and relates the subject matter to relevant current issues and/or daily life activities.',
      sequence: 4,
      rating_type: 'Instruction',
      instrument: 'Knowledge of Subject'
    },

    {
      question: 'Demonstrates up-to-date knowledge and/or awareness on current trends and issues of the subject.',
      sequence: 5,
      rating_type: 'Instruction',
      instrument: 'Knowledge of Subject'
    }            

]

# Instruction - Teaching for Independent Learning
QCE::Question.create [
    {
      question: 'Creates teaching strategies that allow students to practice using concepts they need to understand (interactive discussion)',
      sequence: 1,
      rating_type: 'Instruction',
      instrument: 'Teaching for Independent Learning'
    },

    {
      question: 'Enhances student self-esteem and/or gives due recognition to students performance/potentials.',
      sequence: 2,
      rating_type: 'Instruction',
      instrument: 'Teaching for Independent Learning'
    },

    {
      question: 'Allows students to create their own course with objectives and realistically defined student-professor rules and make them accountable for their performance.',
      sequence: 3,
      rating_type: 'Instruction',
      instrument: 'Teaching for Independent Learning'
    },

    {
      question: 'Allows students to think independently and make their own decisions and holding them accountable for their performance based largely on their success in executing decisions.',
      sequence: 4,
      rating_type: 'Instruction',
      instrument: 'Teaching for Independent Learning'
    },

    {
      question: 'Encourages students to learn beyond what is required and help/guide the students how to apply the concepts learned.',
      sequence: 5,
      rating_type: 'Instruction',
      instrument: 'Teaching for Independent Learning'
    }            

]

# Instruction - Management of Learning
QCE::Question.create [
    {
      question: 'Creates opportunities for intensive and/or extensive contribution of students in the class activities (e.g. breaks class into dyads, triads or buzz/task groups).',
      sequence: 1,
      rating_type: 'Instruction',
      instrument: 'Management of Learning'
    },

    {
      question: 'Assumes roles as facilitator, resource person, coach, inquisitor, integrator, referee in drawing students to contribute to knowledge and understanding of the concepts at hands.',
      sequence: 2,
      rating_type: 'Instruction',
      instrument: 'Management of Learning'
    },

    {
      question: 'Designs and implements learning conditions and experience that promotes healthy exchange and/or confrontations.',
      sequence: 3,
      rating_type: 'Instruction',
      instrument: 'Management of Learning'
    },

    {
      question: 'Structures/re-structures learning and teaching-learning context to enhance attainment of collective learning objectives.',
      sequence: 4,
      rating_type: 'Instruction',
      instrument: 'Management of Learning'
    },

    {
      question: 'Use of Instructional Materials (audio/video materials: fieldtrips, film showing, computer aided instruction and etc.) to reinforce learning processes.',
      sequence: 5,
      rating_type: 'Instruction',
      instrument: 'Management of Learning'
    }            

]

# Research: Clientele Satisfaction
QCE::Question.create [
    {
      question: 'The research proposal/feasibility study submitted is base on the needs/problems of the clients (there is a consultation with the client during the conceptualization of the research proposal).',
      sequence: 1,
      rating_type: 'Research',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Meet and discusses with the clientele the know how of the research results for its usability and/or clients benefits.',
      sequence: 2,
      rating_type: 'Research',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Disseminates and/or present research results in a forum or symposium for proper information of the clientele.',
      sequence: 3,
      rating_type: 'Research',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Utilizes appropriate research procedures, and/or methodologies in meeting clients\' needs and problems.',
      sequence: 4,
      rating_type: 'Research',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Research results would really helps and/or address the clients needs or problems.',
      sequence: 5,
      rating_type: 'Research',
      instrument: 'Clientele Satisfaction'
    }

]

# Research: Leadership
QCE::Question.create [
    {
      question: 'Regularly communicates quality output of the research proceeding to colleagues/staff/clientele/ subordinates.',
      sequence: 1,
      rating_type: 'Research',
      instrument: 'Leadership'
    },

    {
      question: 'Manages priorities to get the job done and able to looks for better ways to confronts conflict situations in an honest and direct manner.',
      sequence: 2,
      rating_type: 'Research',
      instrument: 'Leadership'
    },

    {
      question: 'Encourage/motivates participation/cooperation of the people evolved in the research proceedings.',
      sequence: 3,
      rating_type: 'Research',
      instrument: 'Leadership'
    },

    {
      question: 'Suggest/introduces strategies that enhanced colleague/staff/clientele/subordinates\' skills and abilities to perform the research activity in a more efficient manner.',
      sequence: 4,
      rating_type: 'Research',
      instrument: 'Leadership'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned individual or people involved in their research proceeding.',
      sequence: 5,
      rating_type: 'Research',
      instrument: 'Leadership'
    }

]

# Research: Partnership Development
QCE::Question.create [
    {
      question: 'Coordinates with local residents, businesses and other government functionaries for possible research collaboration.',
      sequence: 1,
      rating_type: 'Research',
      instrument: 'Partnership Development'
    },

    {
      question: 'Promotes networking activities with local communities and various research agencies to gain support/cooperation on research activities.',
      sequence: 2,
      rating_type: 'Research',
      instrument: 'Partnership Development'
    },

    {
      question: 'Conducts consultative meetings and/or dialogues with stakeholders on priority research agenda supporting their needs.',
      sequence: 3,
      rating_type: 'Research',
      instrument: 'Partnership Development'
    },

    {
      question: 'Regularly meet concerned sector to discuss ways in which the research undertaking can create better learning and working environment.',
      sequence: 4,
      rating_type: 'Research',
      instrument: 'Partnership Development'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned sectors, and considering comments, and suggestions for improvement if necessary.',
      sequence: 5,
      rating_type: 'Research',
      instrument: 'Partnership Development'
    }

]

# Research: Community Responsibility
QCE::Question.create [
    {
      question: 'Creates safe research environment where activities conducted consider the ethical and moral predicament of the community and/or the sector involved.',
      sequence: 1,
      rating_type: 'Research',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Conducts researches/feasibility studies where implications on the responsibility of the concerned sectors to the community are addressed.',
      sequence: 2,
      rating_type: 'Research',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Initiates and develops interventions that increase awareness of the responsibility of policy-makers, etc. based on the research findings.',
      sequence: 3,
      rating_type: 'Research',
      instrument: 'Community Responsibility'
    },

    {
      question: 'The researches/feasibility studies conducted with significant contribution to the community and increase awareness on community issues and concerns.',
      sequence: 4,
      rating_type: 'Research',
      instrument: 'Community Responsibility'
    },

    {
      question: 'The research assumes impartial responsibility and accountability on the research proceeding and its effect or impact to the community and/or other sectors involved.',
      sequence: 5,
      rating_type: 'Research',
      instrument: 'Community Responsibility'
    }

]

# Extension: Clientele Satisfaction
QCE::Question.create [
    {
      question: 'The extension proposal/plan is base on the needs/problems of the clients (there is a consultation with the client during the conceptualization of the extension plan).',
      sequence: 1,
      rating_type: 'Extension',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Meet and discusses with the clientele the know how of the extension activity(s) for its usability and/or clients benefits.',
      sequence: 2,
      rating_type: 'Extension',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'There is an information campaign for proper information of the clientele about the extension activity(s).',
      sequence: 3,
      rating_type: 'Extension',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Monitors and evaluates the quantity and quality of services provided to clientele.',
      sequence: 4,
      rating_type: 'Extension',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Extension activity(s) really helps and/or address the clients needs or problems.',
      sequence: 5,
      rating_type: 'Extension',
      instrument: 'Clientele Satisfaction'
    }

]

# Extension: Leadership
QCE::Question.create [
    {
      question: 'Regularly communicates quality output of the extension proceeding to colleagues/staff/clientele subordinates.',
      sequence: 1,
      rating_type: 'Extension',
      instrument: 'Leadership'
    },

    {
      question: 'Manages priorities to get the job done and able to looks for better ways to confronts conflict situations in an honest and direct manner.',
      sequence: 2,
      rating_type: 'Extension',
      instrument: 'Leadership'
    },

    {
      question: 'Encourage/motivates participation/cooperation of the people evolved in the extension activity(s).',
      sequence: 3,
      rating_type: 'Extension',
      instrument: 'Leadership'
    },

    {
      question: 'Suggest/introduces strategies that enhanced colleagues/staff/clientele/subordinates\' skills and abilities to perform the extension activity(s) in a more efficient manner.',
      sequence: 4,
      rating_type: 'Extension',
      instrument: 'Leadership'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned individual or people involved in their extension activity(s).',
      sequence: 5,
      rating_type: 'Extension',
      instrument: 'Leadership'
    }

]

# Extension: Partnership Development
QCE::Question.create [
    {
      question: 'Coordinates with local residents, businesses and other government functionaries for possible extension collaboration.',
      sequence: 1,
      rating_type: 'Extension',
      instrument: 'Partnership Development'
    },

    {
      question: 'Conducts consultative meetings and/or dialogues with stakeholders on priority extension plan supporting their needs.',
      sequence: 2,
      rating_type: 'Extension',
      instrument: 'Partnership Development'
    },

    {
      question: 'Regularly meet concerned sector to discuss ways in which the extension undertaking can create better working environment, and full cooperation and participation.',
      sequence: 3,
      rating_type: 'Extension',
      instrument: 'Partnership Development'
    },

    {
      question: 'Establishes linkages with local/national agencies for possible funding of extension undertakings (sourcing of funds).',
      sequence: 4,
      rating_type: 'Extension',
      instrument: 'Partnership Development'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned sectors, and considering comments, and suggestions for improvement if necessary.',
      sequence: 5,
      rating_type: 'Extension',
      instrument: 'Partnership Development'
    }

]

# Extension: Community Responsibility
QCE::Question.create [
    {
      question: 'Creates safe working environment where activities conducted consider the ethical and moral predicament of the community and/or the sector involved.',
      sequence: 1,
      rating_type: 'Extension',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Conducts extension activity(s) where the responsibilities of the concerned sectors to the community are addressed.',
      sequence: 2,
      rating_type: 'Extension',
      instrument: 'Community Responsibility'
    },

    {
      question: 'The extension activity(s) conducted with significant contribution to the community and increase awareness on community issues and concerns.',
      sequence: 3,
      rating_type: 'Extension',
      instrument: 'Community Responsibility'
    },

    {
      question: 'The extension activity(s) is instrumental and/or in of consideration of public safety, environmental safety, and sharing of quality-related information with the sector involved.',
      sequence: 4,
      rating_type: 'Extension',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Assumes impartial responsibility and accountability on the extension proceeding and its effect or impact to the community and/or other sectors involved.',
      sequence: 5,
      rating_type: 'Extension',
      instrument: 'Community Responsibility'
    }

]

# Production: Clientele Satisfaction
QCE::Question.create [
    {
      question: 'Involves clientele in the planning process of the intended production activity (there is a consultation with the client during the conceptualization of the said activity).',
      sequence: 1,
      rating_type: 'Production',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Meet and discusses with the clientele the know how of the production activity(s) for its usability and/or clients benefits, and/or to assess the quality of production services provided.',
      sequence: 2,
      rating_type: 'Production',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'There is an information campaign for proper information of the clientele about the production activity(s).',
      sequence: 3,
      rating_type: 'Production',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Monitors and evaluates the quantity and quality of services provided to clientele.',
      sequence: 4,
      rating_type: 'Production',
      instrument: 'Clientele Satisfaction'
    },

    {
      question: 'Adopts and implements a system that is supportive of realizing clientele\'s needs/problems.',
      sequence: 5,
      rating_type: 'Production',
      instrument: 'Clientele Satisfaction'
    }

]

# Production: Leadership
QCE::Question.create [
    {
      question: 'Regularly communicates quality output of the production proceeding to colleagues/staff/clientele subordinates.',
      sequence: 1,
      rating_type: 'Production',
      instrument: 'Leadership'
    },

    {
      question: 'Manages priorities to get the job done and able to looks for better ways to confronts conflict situations in an honest and direct manner.',
      sequence: 2,
      rating_type: 'Production',
      instrument: 'Leadership'
    },

    {
      question: 'Encourage/motivates participation/cooperation of the people evolved in the production activity(s).',
      sequence: 3,
      rating_type: 'Production',
      instrument: 'Leadership'
    },

    {
      question: 'Suggest/introduces strategies that enhanced colleagues/staff/clientele/subordinates\' skills and abilities to perform the production activity in a more efficient manner.',
      sequence: 4,
      rating_type: 'Production',
      instrument: 'Leadership'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned individual or people involved in their production activity(s).',
      sequence: 5,
      rating_type: 'Production',
      instrument: 'Leadership'
    }

]

# Production: Partnership Development
QCE::Question.create [
    {
      question: 'Coordinates with local residents, business and other government functionaries for possible production activity(s) collaboration.',
      sequence: 1,
      rating_type: 'Production',
      instrument: 'Partnership Development'
    },

    {
      question: 'Conducts consultative meetings and/or dialogues with stakeholders on priority production plan supporting their needs.',
      sequence: 2,
      rating_type: 'Production',
      instrument: 'Partnership Development'
    },

    {
      question: 'Regularly meet concerned sector to discuss ways in which the production undertaking can create better working environment, and full cooperation and participation.',
      sequence: 3,
      rating_type: 'Production',
      instrument: 'Partnership Development'
    },

    {
      question: 'Establishes linkages with local/national agencies for possible funding of production undertakings (sourcing of funds).',
      sequence: 4,
      rating_type: 'Production',
      instrument: 'Partnership Development'
    },

    {
      question: 'Communicates directly, openly, honestly and shares information with the concerned sectors, and considering comments, and suggestions for improvement if necessary.',
      sequence: 5,
      rating_type: 'Production',
      instrument: 'Partnership Development'
    }

]

# Production: Community Responsibility
QCE::Question.create [
    {
      question: 'Creates safe working environment where activities conducted consider the ethical and moral predicament of the community and/or the sector involved.',
      sequence: 1,
      rating_type: 'Production',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Conducts production activity(s) where the responsibilities of the concerned sectors to the community are addressed.',
      sequence: 2,
      rating_type: 'Production',
      instrument: 'Community Responsibility'
    },

    {
      question: 'The production program extends technical assistance which supports community activities.',
      sequence: 3,
      rating_type: 'Production',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Utilizes appropriate production procedures that conserve and prevent damage to the environment.',
      sequence: 4,
      rating_type: 'Production',
      instrument: 'Community Responsibility'
    },

    {
      question: 'Assumes impartial responsibility and accountability on the production activity(s) and its effect or impact to the community and/or other sectors involved.',
      sequence: 5,
      rating_type: 'Production',
      instrument: 'Community Responsibility'
    }

]

exit

if Rails.env.production? || Rails.env.development?
  Admin.delete_all
  Admin.create username: 'admin1', password: 'admin1'
  Admin.create username: 'admin2', password: 'admin2'
  Admin.create username: 'admin3', password: 'admin3'

  Specialization.delete_all
  Specialization.create name: 'Computer Programming'
  Specialization.create name: 'Computer Networking'
  Specialization.create name: 'Accounting'
  Specialization.create name: 'Community Extension'
  Specialization.create name: 'Guidance Counseling'
  Specialization.create name: 'Mathematics'
  Specialization.create name: 'Fisheries'

  puts 'Adding Student records..........'
  Student.delete_all
  1.upto(100) do |number|
    Student.create first_name: 'Student', last_name: "#{number}"
  end
  puts 'Finished populating Student records!'
  puts

  
  AcademicRanking.delete_all

sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (58,'Instructor',1,1,'2016-03-01 06:34:19.362138','2016-03-27 15:09:07.534618',65,65,79,79);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (59,'Instructor',2,2,'2016-03-01 06:34:19.716830','2016-03-27 15:10:35.027326',66,76,80,89);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (60,'Instructor',3,3,'2016-03-01 06:34:19.719984','2016-03-01 06:34:19.719984',77,87,90,100);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (61,'Assistant Professor',1,4,'2016-03-01 06:34:19.722848','2016-03-01 06:34:19.722848',88,96,80,84);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (62,'Assistant Professor',2,5,'2016-03-01 06:34:19.725680','2016-03-01 06:34:19.725680',97,105,85,89);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (63,'Assistant Professor',3,6,'2016-03-01 06:34:19.728620','2016-03-01 06:34:19.728620',106,114,90,94);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (64,'Assistant Professor',4,7,'2016-03-01 06:34:19.731523','2016-03-01 06:34:19.731523',115,123,95,100);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (65,'Associate Professor',1,8,'2016-03-01 06:34:19.734123','2016-03-01 06:34:19.734123',124,130,76,79);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (66,'Associate Professor',2,9,'2016-03-01 06:34:19.736576','2016-03-01 06:34:19.736576',131,137,80,85);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (67,'Associate Professor',3,10,'2016-03-01 06:34:19.738982','2016-03-01 06:34:19.738982',138,144,86,90);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (68,'Associate Professor',4,11,'2016-03-01 06:34:19.741218','2016-03-01 06:34:19.741218',145,151,91,95);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (69,'Associate Professor',5,12,'2016-03-01 06:34:19.743408','2016-03-01 06:34:19.743408',152,158,96,100);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (70,'Professor',1,13,'2016-03-01 06:34:19.745863','2016-03-01 06:34:19.745863',159,164,61,65);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (71,'Professor',2,14,'2016-03-01 06:34:19.748328','2016-03-01 06:34:19.748328',165,170,66,70);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (72,'Professor',3,15,'2016-03-01 06:34:19.750696','2016-03-01 06:34:19.750696',171,176,71,75);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (73,'Professor',4,16,'2016-03-01 06:34:19.752991','2016-03-01 06:34:19.752991',177,182,76,80);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (74,'Professor',5,17,'2016-03-01 06:34:19.755971','2016-03-01 06:34:19.755971',183,188,81,85);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (75,'Professor',6,18,'2016-03-01 06:34:19.758307','2016-03-01 06:34:19.758307',189,194,86,90);"
  ActiveRecord::Base.connection.execute sql

  sql = "INSERT INTO academic_rankings (id,name,subrank,position,created_at,updated_at,cce_min_points,cce_max_points,qce_min_points,qce_max_points) VALUES (76,'College/University Professor',NULL,19,'2016-03-01 06:34:19.760612','2016-03-01 06:34:19.760612',195,200,91,100);"
  ActiveRecord::Base.connection.execute sql

end

exit

# TODO: Make this data seeding transactional by batches.
if Rails.env.development?
  puts 'Adding AcademicRank records..........'

  AcademicRanking.delete_all
  AcademicRanking.create [
    { name: 'Instructor 1', position: 1 },
    { name: 'Instructor 2', position: 2 },
    { name: 'Instructor 3', position: 3 },
    { name: 'Assistant Professor 1', position: 4 },
    { name: 'Assistant Professor 2', position: 5 },
    { name: 'Assistant Professor 3', position: 6 },
    { name: 'Assistant Professor 4', position: 7 },
    { name: 'Associate Professor 1', position: 8 },
    { name: 'Associate Professor 2', position: 9 },
    { name: 'Associate Professor 3', position: 10 },
    { name: 'Associate Professor 4', position: 11 },
    { name: 'Associate Professor 5', position: 12 },
    { name: 'Professor 1', position: 13 },
    { name: 'Professor 2', position: 14 },
    { name: 'Professor 3', position: 15 },
    { name: 'Professor 4', position: 16 },
    { name: 'Professor 5', position: 17 },
    { name: 'Professor 6', position: 18 },
    { name: 'College/University Professor', position: 19 }
  ]
  
  puts 'Finished populating AcademicRank records!'
  puts

  puts 'Adding sample User records..........'
  User.delete_all
  1.upto(10) do |number|
    value = "user#{number}"
    User.create username: value, password: value
  end
  puts 'Finished populating User records!'
  puts

  puts 'Adding Area Instrument records..........'

  AreaInstrument.create [
    { area: :Instruction, instrument: 'Commitment' },
    { area: :Instruction, instrument: 'Knowledge of Subject' },
    { area: :Instruction, instrument: 'Teaching for Independent Learning' },
    { area: :Instruction, instrument: 'Management of Learning' },

    { area: :Research, instrument: :'Client Satisfaction' },
    { area: :Research, instrument: :'Leadership' },
    { area: :Research, instrument: :'Partnership Development' },
    { area: :Research, instrument: :'Community Responsibility' },

    { area: :Extension, instrument: :'Client Satisfaction' },
    { area: :Extension, instrument: :'Leadership' },
    { area: :Extension, instrument: :'Partnership Development' },
    { area: :Extension, instrument: :'Community Responsibility' },    

    { area: :Production, instrument: :'Client Satisfaction' },
    { area: :Production, instrument: :'Leadership' },
    { area: :Production, instrument: :'Partnership Development' },
    { area: :Production, instrument: :'Community Responsibility' }
  ]
  puts 'Finished populating Area Instrument records!'
  puts

  puts 'Career Path records..........'

  CareerPath.create [
    { name: 'Computer Science' },
    { name: 'Agriculture' },
    { name: 'Nursing' },
    { name: 'Business Administration' },
    { name: 'Fisheries' }
  ]

  puts 'Finished populating Career Path records!'
  puts  
end

=begin    CHEATSHEET

if Rails.env.development?
  puts 'Start database seeding...'
  conn = ActiveRecord::Base.connection
  conn.execute 'truncate academic_rankings;'
  conn.execute 'start transaction;'
    # Standard data for academic rankings. Used SQL statements instead of using an ActiveRecord Academic Rank model since there's no need to use one at the moment.
    insert_all_academic_rankings = 
      "INSERT INTO academic_rankings (name, position) VALUES 
        ('Instructor 1', 1),
        ('Instructor 2', 2),
        ('Instructor 3', 3),
        ('Assistant Professor 1', 4),
        ('Assistant Professor 2', 5),
        ('Assistant Professor 3', 6),
        ('Assistant Professor 4', 7),
        ('Associate Professor 1', 8),
        ('Associate Professor 2', 9),
        ('Associate Professor 3', 10),
        ('Associate Professor 4', 11),
        ('Associate Professor 5', 12),
        ('Professor 1', 13),
        ('Professor 2', 14),
        ('Professor 3', 15),
        ('Professor 4', 16),
        ('Professor 5', 17),
        ('Professor 6', 18),
        ('College/University Professor', 19);"
    conn.execute insert_all_academic_rankings
  conn.execute 'commit;'

  # # Departments
  # Department.create!  [
  #   { name: 'IT' }, 
  #   { name: 'Accounting' },
  #   { name: 'Sales' }, 
  #   { name: 'HR' },
  #   { name: 'Marketing' }, 
  #   { name: 'General Services' }
  # ]    
end

puts 'Database seeding done!'

=end
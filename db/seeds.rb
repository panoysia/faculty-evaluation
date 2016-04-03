# Run: rake db:seed / rake db:setup
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
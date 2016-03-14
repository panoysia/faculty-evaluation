# Run: rake db:seed / rake db:setup

# TODO: Make this data seeding transactional by batches.
if Rails.env.development?
  puts 'Adding AcademicRank records..........'

  AcademicRanking.delete_all
  AcademicRanking.create [
    { rank: 'Instructor 1', position: 1 },
    { rank: 'Instructor 2', position: 2 },
    { rank: 'Instructor 3', position: 3 },
    { rank: 'Assistant Professor 1', position: 4 },
    { rank: 'Assistant Professor 2', position: 5 },
    { rank: 'Assistant Professor 3', position: 6 },
    { rank: 'Assistant Professor 4', position: 7 },
    { rank: 'Associate Professor 1', position: 8 },
    { rank: 'Associate Professor 2', position: 9 },
    { rank: 'Associate Professor 3', position: 10 },
    { rank: 'Associate Professor 4', position: 11 },
    { rank: 'Associate Professor 5', position: 12 },
    { rank: 'Professor 1', position: 13 },
    { rank: 'Professor 2', position: 14 },
    { rank: 'Professor 3', position: 15 },
    { rank: 'Professor 4', position: 16 },
    { rank: 'Professor 5', position: 17 },
    { rank: 'Professor 6', position: 18 },
    { rank: 'College/University Professor', position: 19 }
  ]
  
  puts 'Finished populating AcademicRank records!'
  puts

  puts 'Adding Student records..........'
  Student.delete_all
  1.upto(100) do |number|
    Student.create first_name: 'Student', last_name: "#{number}"
  end
  puts 'Finished populating Student records!'
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
      "INSERT INTO academic_rankings (rank, position) VALUES 
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
20.times do 
  Course.create(
    name: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: Faker::Number.between(1, 36), 
    description: Faker::Educator.university, 
    start_date: Faker::Time.between(DateTime.now - 100, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean
  )
end

Course.create(
    name: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: Faker::Number.between(1, 36), 
    description: Faker::Educator.university, 
    start_date: '2018-01-01',
    information_is_confirmed: Faker::Boolean.boolean
  )
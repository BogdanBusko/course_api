user1 = User.create(
  full_name: 'Busko Bogdan', 
  email: 'busko.bogdan@gmail.com',
  password: '1234567890',
  work_plays: 'Webmil', 
  entrepreneur: true,
  phone: '380977153858'
)

user2 = User.create(
  full_name: 'Busko Andriy',
  email: 'busko.andriy@gmail.com',
  password: '1234567890',
  work_plays: 'Студент'
)

category1 = Category.create(category: 'Programming')
category2 = Category.create(category: 'Dancing')
category3 = Category.create(category: 'Gaming')


5.times do 
  user1.courses.create(
    category_id: category1.id,
    title: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: "#{ Faker::Number.between(1, 36) } т.", 
    description: Faker::Educator.university, 
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    contacts:[
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      ),
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      )
    ]
  )
end

5.times do 
  user2.courses.create(
    category_id: category2.id,
    title: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: "#{ Faker::Number.between(1, 36) } м.", 
    description: Faker::Educator.university,
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    contacts:[
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      ),
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      )
    ]
  )
end

5.times do 
  user1.courses.create(
    category_id: category3.id,
    title: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: "#{ Faker::Number.between(1, 36) } р.",  
    description: Faker::Educator.university, 
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    contacts:[
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      ),
      Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        facebook: Faker::Internet.url
      )
    ]
  )
end
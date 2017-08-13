20.times do 
  course = Course.create(
    title: Faker::Educator.course,
    price: Faker::Number.number(5),
    duration: Faker::Number.between(1, 36), 
    description: Faker::Educator.university, 
    start_date: Faker::Time.between(DateTime.now - 100, DateTime.now + 100),
    link_on_official_site: Faker::Internet.url,
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
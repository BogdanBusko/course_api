user1 = User.create(
  name: 'Busko Bogdan',
  email: 'busko.bogdan@gmail.com',
  password: '1234567890',
  work_place: 'Webmil',
  entrepreneur: true,
  phone: '380977153858'
)

user2 = User.create(
  name: 'Busko Andriy',
  email: 'busko.andriy@gmail.com',
  password: '1234567890'
)

category1 = user1.categories.create(name: 'Programming', information_is_confirmed: true)
category2 = user1.categories.create(name: 'Dancing', information_is_confirmed: true)
category3 = user1.categories.create(name: 'Gaming', information_is_confirmed: true)

2.times do
  user1.courses.create(
    category_id: category1.id,
    name: Faker::Educator.course,
    price: Faker::Number.number(5),
    description: Faker::Educator.university,
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    name_of_company_or_entrepreneur: Faker::Educator.university,
    contacts: [
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
    name: Faker::Educator.course,
    price: Faker::Number.number(5),
    description: Faker::Educator.university,
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    name_of_company_or_entrepreneur: Faker::Educator.university,
    contacts: [
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
    name: Faker::Educator.course,
    price: Faker::Number.number(5),
    description: Faker::Educator.university,
    start_date: Faker::Time.between(DateTime.now, DateTime.now + 100),
    information_is_confirmed: Faker::Boolean.boolean,
    name_of_company_or_entrepreneur: Faker::Educator.university,
    contacts: [
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

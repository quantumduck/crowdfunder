# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Project.destroy_all

User.create(
first_name: "dummy",
last_name: "user",
email: "test@email.com",
password: "password",
password_confirmation: "password",
id: 26
)

Project.create(
title: "test",
description: "A tester project",
goal: 12345,
start_date: Time.now.utc + rand(60).days,
end_date: Time.now.utc + rand(61..1000).days,
user_id: 26
)

Project.create(
title: "test2",
description: "Another tester project",
goal: 12345,
start_date: Time.now.utc + rand(60).days,
end_date: Time.now.utc + rand(61..1000).days,
user_id: 26
)

Project.create(
title: "test3",
description: "A third tester project",
goal: 12345,
start_date: Time.now.utc + rand(60).days,
end_date: Time.now.utc + rand(61..1000).days,
user_id: 26
)
25.times do
  p = Project.create!(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph,
    goal: rand(1..100000),
    start_date: Time.now.utc + rand(60).days,
    end_date: Time.now.utc + rand(61..1000).days
  )
 5.times do
   p.rewards.create!(
     description: Faker::Superhero.power,
     dollar_amount: rand(1..100),
   )
 end
end

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do
  r = Reward.all.sample
  Pledge.create!(
    user: User.all.sample,
    reward: r,
    dollar_amount: r.dollar_amount + rand(10)
  )
end

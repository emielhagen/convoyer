puts 'Deleting all users'
User.delete_all
puts 'Deleting all convoys'
Convoy.delete_all
puts 'Deleting all favorite convoys'
FavoriteConvoy.delete_all
puts 'Deleting all locations'
Location.delete_all
puts 'Deleting all members'
Member.delete_all
puts 'Deleting all reviews'
Review.delete_all

puts '==============================='
puts 'Everything is deleted correctly'
puts '==============================='


5.times do |n|
  user = User.new
  user.email = Faker::Internet.email
  user.name = Faker::Name.first_name
  user.password = "Password123"
  user.photo = Faker::Avatar.image("my-own-slug", "50x50")
  user.country = Faker::Address.country
  user.phone_number = Faker::PhoneNumber.phone_number
  user.age = rand(20..80)
  user.save!
  puts "Seeded User: ##{n+1}"
end

user = User.new
  user.email = 'emiel.hagen@gmail.com'
  user.name = Faker::Name.first_name
  user.password = "Password123"
  user.photo = Faker::Avatar.image("my-own-slug", "50x50")
  user.country = Faker::Address.country
  user.phone_number = Faker::PhoneNumber.phone_number
  user.age = rand(20..80)
  user.save!

puts '===================================='

15.times do |n|
  Location.create(
    name: Faker::Nation.capital_city,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
  puts "Seeded location: ##{n+1}"
end

puts '===================================='


User.all.each_with_index do |user, n|
  convoy = Convoy.new
  convoy.user_id = user.id
  convoy.to_location_id = Location.all.sample(1).first.id
  convoy.from_location_id = Location.all.sample(1).first.id
  convoy.name = Faker::App.name
  convoy.start_date = Faker::Date.forward(365)
  convoy.finish_date = Faker::Date.forward(365)
  convoy.photo = Faker::LoremPixel.image
  convoy.save!
  puts "Seeded Convoy ##{n+1}"
end

5.times do |n|
  FavoriteConvoy.create(
    user_id: User.all.sample(1).first.id,
    convoy_id: Convoy.pluck(:id).sample(1).first
    )
end

puts 'Created favorite convoys'

10.times do |n|
  Review.create(
    content: Faker::ChuckNorris.fact,
    rating: rand(5..10)
  )
end

puts 'Created reviews'

5.times do |n|
  Member.create(
    user_id: User.all.sample(1).first.id,
    convoy_id: Convoy.pluck(:id).sample(1).first
    )
end

puts 'Created 5 members'










require 'faker'

5.times do 
    User.create(name: Faker::Name.name)
end 

5.times do 
Hike.create(name: Faker::Name.name, address: Faker::Address.city, difficulty_level: Faker::Number.within(range: 1..5)) #could fill manually with my own hike name data
end #conneting to api could be a stretch 

Favorite.create(user_id: User.all.sample.id, hiker_id: Hike.all.sample.id, notes: "Bring bear spray for this hike.")
require 'faker'

5.times do 
    User.create(name: Faker::Name.name)
end 

10.times do 
    Hike.create(name: Faker::Address.community, address: Faker::Address.city, difficulty_level: Faker::Number.within(range: 1..5)) #could fill manually with my own hike name data
end #connecting to api could be a stretch 

10.times do 
    Favorite.create(user_id: User.all.sample.id, hike_id: Hike.all.sample.id, notes: "Bring bear spray for this hike.")
end
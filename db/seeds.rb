10.times do 
  Event.create!(
    title:Faker::Beer.name,
    image: "http://unsplash.it/600/400/?random",
    description:Faker::StarWars.quote,
    date:Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    thumb_image:Faker::Avatar.image,
    location:Faker::StarWars.planet
  )
end
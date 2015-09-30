# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



100.times do
  username = Faker::Book.title << Faker::App.name
  usern = username.split.join
  User.create ({
    name: Faker::Name.name,
    uname: usern,
    password_digest: "password"
  })
end

300.times do
  tweet_message = Faker::Hacker.say_something_smart
  hacker_word = tweet_message.split.sample
  tweet = Tweet.create ({
    title: Faker::App.name,
    message: tweet_message,
    user_id: Faker::Number.between(1, 100)
  })
end

300.times do
  tweet_message = Faker::Hacker.say_something_smart
  hacker_word = Faker::Hacker.noun
  hacker_word2 = Faker::Hacker.noun
  hacker_word3 = Faker::Hacker.noun
  hacker_word4 = Faker::Hacker.noun
  hacker_word5 = Faker::Hacker.noun
  doge_start = %w(how such very many)
  doge_end = ["wonder", "tweet", "title", "blog", "marvels", "sparkle", "tingle", "yolo", "mystery", "#{hacker_word}", "ROFL", "OMG", "#{hacker_word2}", "post", "comment", "#{hacker_word3}", "#{hacker_word4}", "#{hacker_word5}", "lorem", "ipsum"]
  doge_exclaim = ["???", "!", "!!!", " <3"]
  doge = 3.times.map { doge_start.sample.capitalize + " " + doge_end.sample + doge_exclaim.sample + "\n" }.join("")
  Comment.create ({
    body: doge,
    tweet_id: Faker::Number.between(1, 300)
  })
end


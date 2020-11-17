require "faker"
100.times do
  Post.create(title: Faker::Hacker.say_something_smart,
              url: Faker::Internet.url,
              votes: Faker::Number.number(digits: 4))
end

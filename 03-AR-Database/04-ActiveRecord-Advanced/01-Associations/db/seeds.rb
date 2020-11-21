# TODO: Write a seed
require 'faker'

puts "creating 5 fake users '"
5.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email
  )
  user.save!

  rand(5..10).times do
    post = Post.new(
      title: Faker::Name.name,
      url: Faker::Name.name,
      votes: rand(0..5),
      user: user
    )
    post.save!
  end
end

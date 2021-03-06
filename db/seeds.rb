require 'faker'

# Create Users
5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  # user.created_at Faker::Time.between(14.days.ago, Time.now)
  user.save!
end

users = User.all

# Create Bookmarks
25.times do
  Bookmark.create!(
    user:     users.sample,
    title:    Faker::Name.title,
    # url:      Faker::Internet.url waiting for bux fix
    url:      "#{Faker::Lorem.characters(6)}.com",
    created_at: Faker::Time.between(14.days.ago, Time.now)
  )
end

puts "Seed finished."
puts "#{User.count} users created."
puts "#{Bookmark.count} bookmarks created."

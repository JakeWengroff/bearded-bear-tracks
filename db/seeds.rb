require 'faker'

# Create Users
5.times do
 user = User.new(
   name: Faker::Internet.user_name,
   email:    Faker::Internet.email,
   password: Faker::Lorem.characters(10)
 )
 user.skip_confirmation!
 user.save!
end

admin = User.new(
  name: "Admin Beard",
  email:    "hello@beard.com",
  password: "helloworld"
)
admin.skip_confirmation!
admin.save!

users = User.all 

20.times do
 topic = Topic.create!(
   user:   users.sample,
<<<<<<< HEAD
   title:  "Cool Topic!"
=======
   title:  Faker::Lorem.word
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
 )
end
topics = Topic.all

60.times do
 bookmark = Bookmark.create!(
   topic:   topics.sample,
<<<<<<< HEAD
   url:   Faker::Internet.url
=======
   url:   Faker::Internet.domain_name
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
 )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} env bookmarks created"
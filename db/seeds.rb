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
   title:  Faker::Lorem.word
 )
end
topics = Topic.all

60.times do
 bookmark = Bookmark.create!(
   topic:   topics.sample,
   url:   Faker::Internet.domain_name
 )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} env bookmarks created"
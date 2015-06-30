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

bookmarks = Bookmark.all

30.times do
  like = Like.create!(
    user: users.sample,
    bookmark: bookmarks.sample)
end
likes = Like.all

puts "Seed finished"
<<<<<<< HEAD
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
puts "#{{Like.count} likes created."
=======
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
puts "#{Like.count} likes created"
>>>>>>> 92a72f27f048ff23fd4c2b995da069e63d3033f7

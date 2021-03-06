require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "hello#{n}@bearded-bear-tracks.com" }
    password  "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
end
require 'factory_girl'

FactoryGirl.define do
  factory :topic do
    title "Interesting Topic"
    user
  end
end
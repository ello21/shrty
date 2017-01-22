require 'faker'

FactoryGirl.define do
  factory :short_link do
    user_short_key { Faker::Internet.unique.password(1,10) }
    destination_url { Faker::Internet.url }
    http_status 301
  end
end

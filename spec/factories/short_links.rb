FactoryGirl.define do
  factory :short_link do
    user_short_key "MyString"
    destination_url "MyText"
    http_status 1
  end
end

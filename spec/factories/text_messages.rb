FactoryGirl.define do
  factory :text_message do
    message "Hi, check out this awesome website: https://shr-ty.herokuapp.com/" + Faker::Internet.unique.password(1,10)
    from_phone_number "+13902339402"
    to_phone_number "+19384773928"
    short_link
  end
end

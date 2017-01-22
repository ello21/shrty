FactoryGirl.define do
  factory :text_message do
    message "MyText"
    from_phone_number "MyString"
    to_phone_number "MyString"
    short_link nil
  end
end

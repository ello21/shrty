require 'rails_helper'

RSpec.describe TextMessage, type: :model do
  	it "has a valid factory" do
    	FactoryGirl.create(:text_message).should be_valid
	end

	it "is invalid without a 'to' phone number" do
  		FactoryGirl.build(:text_message, to_phone_number: nil).should_not be_valid
	end

	it "does not allow 'to' phone number to be more than 12 digits" do
  		FactoryGirl.build(:text_message, to_phone_number: "+1532432122336332").should_not be_valid
	end

	it "does not allow 'to' phone number to be less than 12 digits" do
  		FactoryGirl.build(:text_message, to_phone_number: "+16332").should_not be_valid
	end

	it "does not allow 'to' phone number to contain spaces or characters other than numbers" do
  		FactoryGirl.build(:text_message, to_phone_number: "+1 3.4332490").should_not be_valid
	end

	it "will raise an error without a short_link" do
  		expect { FactoryGirl.create(:text_message, short_link_id: nil) }.to raise_error(NoMethodError)
	end

	it "returns a message with the full short link url included" do
		short_link = FactoryGirl.create(:short_link, user_short_key: "5lg", destination_url: "http://friends.com")
		text_msg = FactoryGirl.create(:text_message, short_link: short_link)
  		text_msg.message.should == "Hi, check out this awesome website: https://shr-ty.herokuapp.com/5lg"
	end
end
		
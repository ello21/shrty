require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  	it "has a valid factory" do
    	FactoryGirl.create(:short_link).should be_valid
	end

	it "is invalid without a user short key" do
  		FactoryGirl.build(:short_link, user_short_key: nil).should_not be_valid
	end

	it "does not allow duplicate user short keys" do
		FactoryGirl.create(:short_link, user_short_key: "3dg")
  		FactoryGirl.build(:short_link, user_short_key: "3dg").should_not be_valid
	end

	it "does not allow user short keys to be longer than 10 characters" do
		 FactoryGirl.build(:short_link, user_short_key: "fl39vndkf93nf2e3").should_not be_valid
	end

	it "does not allow user short keys to contain spaces or characters other than '-, _, a-z, A-Z, 0-9'" do
		FactoryGirl.build(:short_link, user_short_key: "fl39v d23").should_not be_valid
	end

	it "is invalid without a destination url" do
  		FactoryGirl.build(:short_link, destination_url: nil).should_not be_valid
	end

	it "validates format of destination url" do
		FactoryGirl.build(:short_link, destination_url: "www.amazon.com").should_not be_valid
	end

	it "raises an error if destination url is invalid" do
		expect{ FactoryGirl.create(:short_link, destination_url: "www.amazon") }.to raise_error.with_message(/Your long url is invalid./)
	end

	it "returns a full short link url as a string" do
		short_link = FactoryGirl.create(:short_link, user_short_key: "5lg")
		short_link.full_short_link_url.should == "https://shr-ty.herokuapp.com/5lg"
	end

end

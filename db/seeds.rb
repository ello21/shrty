# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

ShortLink.destroy_all
TestMessages.destroy_all

20.times.do
	ShortLink.create(
		user_short_key: Faker::Internet.unique.password(1,10),
		destination_url: Faker::Internet.url, 
		http_status: 301)
end


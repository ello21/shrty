# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ShortLink.destroy_all
TextMessage.destroy_all

ShortLink.create!(
		user_short_key: "tb",
		destination_url: "http://www.ticketbud.com", 
		http_status: 301
)

ShortLink.create!(
		user_short_key: "3lz",
		destination_url: "http://www.facebook.com", 
		http_status: 301
)

ShortLink.create!(
		user_short_key: "2cn3",
		destination_url: "http://www.amazon.com", 
		http_status: 301
)

ShortLink.create!(
		user_short_key: "techy",
		destination_url: "http://http://topyaps.com/top-10-tech-magazines-recommended-for-technology-buffs", 
		http_status: 301
)

class ShortLink < ActiveRecord::Base
	# Use URI module for url parsing and validation
	require "uri"

	SHORT_LINK_HOST = "https://shr-ty.herokuapp.com/"

	has_many :text_messages
	
	validates :destination_url, presence: true
	validate :valid_destination_url?

	validates :user_short_key, 	presence: true, 
								uniqueness: true,
								length: { maximum: 10,
									too_long: "Please keep your Shrty link under %{count} characters. That's what this party is all about, right?" },
								format: { with: /\A[a-zA-Z0-9_-]+\z/,
									message:"Shrty links cannot contain spaces and can only contain the following characters: '-, _, a-z, A-Z, 0-9'" }

	def valid_destination_url?
		uri = URI.parse(self.destination_url)
		if (uri.is_a?(URI::HTTP) && !uri.host.nil?)
			true
		else
			errors.add(:destination_url, "Your long url is invalid. Please include 'http://'")
			puts "not valid url"
			false
		end
	rescue URI::InvalidURIError
		false
	end

	def full_short_link_url
	 	SHORT_LINK_HOST + self.user_short_key
	end
end

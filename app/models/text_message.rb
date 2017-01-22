class TextMessage < ActiveRecord::Base
	# after_create :send_text_message

  	belongs_to :short_link

  	MESSAGE_TEMPLATE = "Hi, check out this awesome website: https://shr-ty.herokuapp.com/"

	validates :to_phone_number, :short_link, :message, presence: true
	validates :to_phone_number, length: {is: 12, 
														message: "Please enter the 10 digit phone number"}
	validates :to_phone_number, format: { with: /\A\+1[0-9]{10}+\z/,
														message:"Phone number cannot contain spaces and can only contain numbers" }

	def message
		self.message = MESSAGE_TEMPLATE + self.short_link.user_short_key
	end

	def send_text_message
		client.messages.create(
			to: to_phone_number,
			from: from_phone_number,
			body: message
		)
	end

	private
	
	def client
		@client ||= Twilio::REST::Client.new
	end

	def from_phone_number
		@from_phone_number ||= Rails.application.secrets.twilio_phone_number
	end
end

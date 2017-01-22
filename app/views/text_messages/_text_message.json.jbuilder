json.extract! text_message, :id, :message, :from_phone_number, :to_phone_number, :short_link_id, :created_at, :updated_at
json.url text_message_url(text_message, format: :json)
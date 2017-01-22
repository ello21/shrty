json.extract! short_link, :id, :user_short_key, :destination_url, :http_status, :created_at, :updated_at
json.url short_link_url(short_link, format: :json)
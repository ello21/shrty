require 'rails_helper'

RSpec.describe "TextMessages", type: :request do
  describe "GET /text_messages" do
    it "works! (now write some real specs)" do
      get text_messages_path
      expect(response).to have_http_status(200)
    end
  end
end

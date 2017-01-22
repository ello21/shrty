require 'rails_helper'

RSpec.describe "ShortLinks", type: :request do
  describe "GET /short_links" do
    it "works! (now write some real specs)" do
      get short_links_path
      expect(response).to have_http_status(200)
    end
  end
end

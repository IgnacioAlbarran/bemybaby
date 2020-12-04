require 'rails_helper'

RSpec.describe "Heights", type: :request do
  describe "GET /heights" do
    it "works! (now write some real specs)" do
      get heights_path
      expect(response).to have_http_status(200)
    end
  end
end

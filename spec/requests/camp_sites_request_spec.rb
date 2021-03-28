require 'rails_helper'

RSpec.describe "CampSites", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/camp_sites/show"
      expect(response).to have_http_status(:success)
    end
  end

end

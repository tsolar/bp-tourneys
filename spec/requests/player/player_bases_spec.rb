require "rails_helper"

RSpec.describe "Player::Bases", type: :request do
  describe "GET /player_bases" do
    it "works! (now write some real specs)" do
      get player_bases_path
      expect(response).to have_http_status(200)
    end
  end
end

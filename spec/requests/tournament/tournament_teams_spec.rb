require 'rails_helper'

RSpec.describe "Tournament::Teams", type: :request do
  describe "GET /tournament_teams" do
    it "works! (now write some real specs)" do
      get tournament_teams_path
      expect(response).to have_http_status(200)
    end
  end
end

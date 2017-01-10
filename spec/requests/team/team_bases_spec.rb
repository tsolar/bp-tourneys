require 'rails_helper'

RSpec.describe "Team::Bases", type: :request do
  describe "GET /team_bases" do
    it "works! (now write some real specs)" do
      get team_bases_path
      expect(response).to have_http_status(200)
    end
  end
end

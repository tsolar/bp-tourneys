require 'rails_helper'

RSpec.describe "Tournament::Teams", type: :request do
  describe "listing tournament teams" do
    context "when tournament exists" do
      let(:tournament) { FactoryGirl.create(:tournament_basis) }

      it "lists tournament teams" do
        get tournament_teams_path(tournament_id: tournament.to_param)
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
    end

    context "when tournament does not exist" do
      it "should return 404" do
        get tournament_teams_path tournament_id: 0
        expect(response).to have_http_status(404)
      end
    end
  end
end

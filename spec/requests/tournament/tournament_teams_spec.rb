require "rails_helper"

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

  describe "GET /tournaments/:id/teams/new" do
    context "when tournament team exists" do
      let(:tournament) { FactoryGirl.create(:tournament_basis) }

      context "when user is logged in" do
        it "should show form" do
          user = FactoryGirl.create(:user)
          user.confirm
          sign_in user

          get new_tournament_team_path(tournament_id: tournament.to_param)
          expect(controller.current_user).to eq user

          expect(response).to have_http_status(200)
          expect(assigns(:tournament)).to eq tournament
          expect(assigns(:tournament_team)).to be_a(Tournament::Team)
          expect(assigns(:tournament_team)).to be_new_record
          expect(assigns(:tournament_team).tournament).to eq tournament
          expect(assigns(:tournament_team).team).to be_a(Team::Base)
          expect(assigns(:tournament_team).team).to be_new_record
          expect(response).to render_template("tournament/teams/new")
        end
      end

      context "when user is not logged in" do
        it "redirects to sign_in page" do
          get new_tournament_team_path(tournament_id: tournament.to_param)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end

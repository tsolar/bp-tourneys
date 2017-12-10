require "rails_helper"

RSpec.describe "Team::Bases", type: :request do
  describe "GET /team_bases" do
    it "works! (now write some real specs)" do
      get team_bases_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /team_bases/:id" do
    context "when team exists" do
      let(:team) { FactoryGirl.create(:team_basis) }

      context "when user is logged in" do
        it "shows team" do
          get team_basis_path(id: team.to_param)
          expect(assigns(:team_basis)).to eq team
          expect(response).to render_template("team/bases/show")
          expect(response).to have_http_status(200)
        end
      end

      context "when user is not logged in" do
        # show it or not?
      end
    end

    context "when team does not exist" do
      it "should show 404 page" do
        get team_basis_path(id: 0)
        expect(response).to have_http_status(404)
      end
    end
  end
end

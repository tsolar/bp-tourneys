require "rails_helper"

RSpec.describe User::TeamsController, type: :controller do

  describe "GET #index" do
    context "when user is logged in" do
      login_user
      before(:each) do
        FactoryBot.create_list(:team_basis, 3, owner: @user)
      end
      it "returns http success" do
        get :index
        expect(assigns(:teams)).to eq Team::Base.where(owner: @user)

        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not logged in" do
      it "redirects to login screen" do
        get :index
        expect(assigns(:teams)).to eq nil
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end

require "rails_helper"

RSpec.describe User::TournamentsController, type: :controller do

  describe "GET #index" do
    context "when user is logged in" do
      login_user
      it "returns http success" do
        get :index
        expect(assigns(:tournaments)).to eq Tournament::Base.where(owner: @user)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not logged in" do
      it "redirects to login screen" do
        get :index
        expect(assigns(:tournaments)).to eq nil
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end

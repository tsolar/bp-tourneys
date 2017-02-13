require 'rails_helper'

RSpec.describe MyProfileController, type: :controller do

  describe "GET #index" do
    context "when user is logged in" do
      login_user

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not logged in" do
      it "redirects to new user session path" do
        get :index
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end

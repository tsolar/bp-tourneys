require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Tournament::BasesController, type: :controller do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Tournament::Base. As you add validations to Tournament::Base, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:tournament_basis)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:tournament_basis_invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Tournament::BasesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tournament_bases as @tournament_bases" do
      base = Tournament::Base.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:tournament_bases)).to eq([base])
    end
  end

  describe "GET #show" do
    it "assigns the requested tournament_base as @tournament_base" do
      base = Tournament::Base.create! valid_attributes
      get :show, params: {id: base.to_param}, session: valid_session
      expect(assigns(:tournament_basis)).to eq(base)
    end
  end

  describe "GET #new" do
    it "assigns a new tournament_base as @tournament_base" do
      get :new, params: {}, session: valid_session
      expect(assigns(:tournament_basis)).to be_a_new(Tournament::Base)
      expect(assigns(:tournament_basis).owner).to eq @user
    end
  end

  describe "GET #edit" do
    it "assigns the requested tournament_base as @tournament_base" do
      base = Tournament::Base.create! valid_attributes
      get :edit, params: {id: base.to_param}, session: valid_session
      expect(assigns(:tournament_basis)).to eq(base)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tournament::Base" do
        expect {
          post :create, params: {tournament_base: valid_attributes}, session: valid_session
        }.to change(Tournament::Base, :count).by(1)
        expect(Tournament::Base.last.owner).to eq @user
      end

      it "assigns a newly created tournament_base as @tournament_base" do
        post :create, params: {tournament_base: valid_attributes}, session: valid_session
        expect(assigns(:tournament_basis)).to be_a(Tournament::Base)
        expect(assigns(:tournament_basis)).to be_persisted
        expect(assigns(:tournament_basis).owner).to eq @user
      end

      it "redirects to the created tournament_base" do
        post :create, params: {tournament_base: valid_attributes}, session: valid_session
        expect(response).to redirect_to(tournament_path(Tournament::Base.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tournament_base as @tournament_base" do
        post :create, params: {tournament_base: invalid_attributes}, session: valid_session
        expect(assigns(:tournament_basis)).to be_a_new(Tournament::Base)
      end

      it "re-renders the 'new' template" do
        post :create, params: {tournament_base: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:tournament_basis)
      }

      it "updates the requested tournament_base" do
        base = Tournament::Base.create! valid_attributes
        put :update, params: {id: base.to_param, tournament_base: new_attributes}, session: valid_session
        base.reload
        expect(base.name).to eq(new_attributes[:name])
        expect(base.owner).to eq(@user)
      end

      it "assigns the requested tournament_base as @tournament_base" do
        base = Tournament::Base.create! valid_attributes
        put :update, params: {id: base.to_param, tournament_base: valid_attributes}, session: valid_session
        expect(assigns(:tournament_basis)).to eq(base)
      end

      it "redirects to the tournament_base" do
        base = Tournament::Base.create! valid_attributes
        put :update, params: {id: base.to_param, tournament_base: valid_attributes}, session: valid_session
        expect(response).to redirect_to(tournament_path(base))
      end
    end

    context "with invalid params" do
      it "assigns the tournament_base as @tournament_base" do
        base = Tournament::Base.create! valid_attributes
        put :update, params: {id: base.to_param, tournament_base: invalid_attributes}, session: valid_session
        expect(assigns(:tournament_basis)).to eq(base)
      end

      it "re-renders the 'edit' template" do
        base = Tournament::Base.create! valid_attributes
        put :update, params: {id: base.to_param, tournament_base: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tournament_base" do
      base = Tournament::Base.create! valid_attributes
      expect {
        delete :destroy, params: {id: base.to_param}, session: valid_session
      }.to change(Tournament::Base, :count).by(-1)
    end

    it "redirects to the tournament_bases list" do
      base = Tournament::Base.create! valid_attributes
      delete :destroy, params: {id: base.to_param}, session: valid_session
      expect(response).to redirect_to(tournaments_url)
    end
  end

end

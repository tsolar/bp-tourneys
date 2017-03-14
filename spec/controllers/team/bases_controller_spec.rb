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

RSpec.describe Team::BasesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Team::Base. As you add validations to Team::Base, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:team_basis)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:team_basis_invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Team::BasesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all team_bases as @team_bases" do
      base = Team::Base.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:team_bases)).to eq([base])
    end
  end

  describe "GET #show" do
    it "assigns the requested team_base as @team_base" do
      base = Team::Base.create! valid_attributes
      get :show, params: {id: base.to_param}, session: valid_session
      expect(assigns(:team_basis)).to eq(base)
    end
  end

  describe "GET #new" do
    it "assigns a new team_base as @team_base" do
      get :new, params: {}, session: valid_session
      expect(assigns(:team_basis)).to be_a_new(Team::Base)
    end
  end

  describe "GET #edit" do
    it "assigns the requested team_base as @team_base" do
      base = Team::Base.create! valid_attributes
      get :edit, params: {id: base.to_param}, session: valid_session
      expect(assigns(:team_basis)).to eq(base)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Team::Base" do
        expect {
          post :create, params: {team_base: valid_attributes}, session: valid_session
        }.to change(Team::Base, :count).by(1)
      end

      it "assigns a newly created team_base as @team_base" do
        post :create, params: {team_base: valid_attributes}, session: valid_session
        expect(assigns(:team_basis)).to be_a(Team::Base)
        expect(assigns(:team_basis)).to be_persisted
      end

      it "redirects to the created team_base" do
        post :create, params: {team_base: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Team::Base.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved team_base as @team_base" do
        post :create, params: {team_base: invalid_attributes}, session: valid_session
        expect(assigns(:team_basis)).to be_a_new(Team::Base)
      end

      it "re-renders the 'new' template" do
        post :create, params: {team_base: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:team_basis)
      }

      it "updates the requested team_base" do
        base = Team::Base.create! valid_attributes
        put :update, params: {id: base.to_param, team_base: new_attributes}, session: valid_session
        base.reload
        expect(base.name).to eq new_attributes[:name]
      end

      it "assigns the requested team_base as @team_base" do
        base = Team::Base.create! valid_attributes
        put :update, params: {id: base.to_param, team_base: valid_attributes}, session: valid_session
        expect(assigns(:team_basis)).to eq(base)
      end

      it "redirects to the team_base" do
        base = Team::Base.create! valid_attributes
        put :update, params: {id: base.to_param, team_base: valid_attributes}, session: valid_session
        expect(response).to redirect_to(base)
      end
    end

    context "with invalid params" do
      it "assigns the team_base as @team_base" do
        base = Team::Base.create! valid_attributes
        put :update, params: {id: base.to_param, team_base: invalid_attributes}, session: valid_session
        expect(assigns(:team_basis)).to eq(base)
      end

      it "re-renders the 'edit' template" do
        base = Team::Base.create! valid_attributes
        put :update, params: {id: base.to_param, team_base: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested team_base" do
      base = Team::Base.create! valid_attributes
      expect {
        delete :destroy, params: {id: base.to_param}, session: valid_session
      }.to change(Team::Base, :count).by(-1)
    end

    it "redirects to the team_bases list" do
      base = Team::Base.create! valid_attributes
      delete :destroy, params: {id: base.to_param}, session: valid_session
      expect(response).to redirect_to(team_bases_url)
    end
  end

end

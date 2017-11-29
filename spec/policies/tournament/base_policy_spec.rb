require "rails_helper"

RSpec.describe Tournament::BasePolicy do

  let(:user) { FactoryGirl.create(:user) }
  let(:tournament) { FactoryGirl.create(:tournament_basis, owner: user) }

  subject { described_class.new(user, tournament) }

  context "user is not logged in" do
    let(:user) { nil }
    let(:tournament) { FactoryGirl.create(:tournament_basis) }

    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context "user is logged in" do
    context "user is the tournament owner" do
      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to permit_edit_and_update_actions }
    end

    context "user is not the tournament owner" do
      let(:other_user) { FactoryGirl.create(:user) }
      let(:tournament) {
        FactoryGirl.create(:tournament_basis, owner: other_user)
      }

      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end
  end

  # permissions ".scope" do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :index? do
  #   it "grants access" do
  #     expect(subject).to permit(user, Tournament::Base)
  #   end
  # end

  # permissions :show? do
  #   it "grants access" do
  #     tournament = FactoryGirl.create(:tournament_basis)
  #     expect(subject).to permit(user, tournament)
  #   end
  # end

  # permissions :create? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :update? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :destroy? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end
end

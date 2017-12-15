require "rails_helper"

RSpec.describe Team::BasePolicy do

  let(:user) { FactoryBot.create(:user) }
  let(:team) { FactoryBot.create(:team_basis, owner: user) }

  subject { described_class.new(user, team) }

  context "user is not logged in" do
    let(:user) { nil }
    let(:team) { FactoryBot.create(:team_basis) }

    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context "user is logged in" do
    context "user is the team owner" do
      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to permit_edit_and_update_actions }
    end

    context "user is not the team owner" do
      let(:other_user) { FactoryBot.create(:user) }
      let(:team) {
        FactoryBot.create(:team_basis, owner: other_user)
      }

      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end
  end
end

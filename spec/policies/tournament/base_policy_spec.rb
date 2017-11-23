require "rails_helper"

RSpec.describe Tournament::BasePolicy do

  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :index? do
    it "grants access" do
      expect(subject).to permit(user, Tournament::Base)
    end
  end

  permissions :show? do
    it "grants access" do
      tournament = FactoryGirl.create(:tournament_basis)
      expect(subject).to permit(user, tournament)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end

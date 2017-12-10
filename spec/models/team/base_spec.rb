require "rails_helper"

RSpec.describe Team::Base, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "Relationships" do
    it { should have_many(:tournament_teams)
        .class_name("Tournament::Team")
        .with_foreign_key(:team_id) }

    it { should have_many(:tournaments)
        .through(:tournament_teams)
        .class_name("Tournament::Base")
        .source(:tournament) }

    it { should belong_to(:owner)
        .class_name("User")
        .with_foreign_key(:owner_id)
        .inverse_of(:teams) }
  end

  describe "Create" do
    it "should create a valid Team" do
      team = FactoryGirl.create(:team_basis)
      expect(team).to be_valid
      expect(team).to be_persisted
    end

    it "should not create an invalid Team" do
      team = FactoryGirl.build(:team_basis_invalid)
      expect(team).not_to be_valid
      expect(team.save).to be false
    end
  end
end

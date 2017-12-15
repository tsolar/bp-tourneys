require "rails_helper"

RSpec.describe User, type: :model do
  describe "Create" do
    it "should create a valid user" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
      expect(user.save).to be true
    end

    context "when it is created with teams_attributes" do
      it "should create a valid user with teams" do
        teams_attributes = FactoryBot.attributes_for_list(:team_basis, 3)
        user = FactoryBot.build(:user, teams_attributes: teams_attributes)
        expect(user.save).to be true
        expect(user.teams.count).to eq 3
      end

      it "should create valid user with 2 of 3 teams (a team has no name)" do
        teams_attributes = FactoryBot.attributes_for_list(:team_basis, 2)
        teams_attributes << FactoryBot.attributes_for(:team_basis, name: "")
        expect(teams_attributes.count).to eq 3
        user = FactoryBot.build(:user, teams_attributes: teams_attributes)
        expect(user.save).to be true
        expect(user.teams.count).to eq 2
      end
    end
  end

  describe "Relationships" do
    it { should have_many(:teams)
                  .class_name("Team::Base")
                  .with_foreign_key(:owner_id)
                  .inverse_of(:owner) }

    it { should accept_nested_attributes_for(:teams) }
  end

  describe "#username" do
    let(:email) { "email@example.com" }
    let(:user) { FactoryBot.create(:user, email: email) }

    it "should return user email" do
      expect(user.username).to eq email
    end
  end
end

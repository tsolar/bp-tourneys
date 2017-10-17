require 'rails_helper'

RSpec.describe Tournament::Base, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Relationships" do
    it { should have_many(:tournament_teams)
        .class_name('Tournament::Team')
        .with_foreign_key(:tournament_id) }

    it { should have_many(:teams)
        .through(:tournament_teams)
        .class_name('Team::Base')
        .source(:team) }

    it { should belong_to(:owner)
        .class_name('User')
        .with_foreign_key(:owner_id)
        .inverse_of(:tournaments) }

  end

  describe "Create" do
    it "should create a valid Tournament" do
      tournament = FactoryGirl.create(:tournament_basis)
      expect(tournament).to be_valid
      expect(tournament).to be_persisted
    end

    it "should not create an invalid Tournament" do
      tournament = FactoryGirl.build(:tournament_basis_invalid)
      expect(tournament).not_to be_valid
      expect(tournament.save).to be false
    end
  end
end

require 'rails_helper'

RSpec.describe Tournament::Team, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:tournament) }
    it {
      FactoryGirl.create(:tournament_team)
      should validate_uniqueness_of(:team_id).scoped_to(:tournament_id)
    }

    it 'should have only 3 players!' # what about squad?
  end

  describe "Delegates" do
    it { should delegate_method(:name).to(:team).with_prefix(true) }
  end

  describe "Relationships" do
    it { should belong_to(:team)
                 .class_name('Team::Base')
                 .with_foreign_key(:team_id) }

    it { should belong_to(:tournament)
                 .class_name('Tournament::Base')
                 .with_foreign_key(:tournament_id) }

    it { should have_many(:team_players)
                  .class_name('Tournament::TeamPlayer')
                  .with_foreign_key(:tournament_team_id) }

    it { should have_many(:players)
                 .through(:team_players)
                 .class_name('Player::Base')
                 .source(:player) }
  end
end

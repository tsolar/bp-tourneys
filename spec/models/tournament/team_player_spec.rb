require 'rails_helper'

RSpec.describe Tournament::TeamPlayer, type: :model do
  describe "Validations" do

    it { should validate_presence_of(:tournament_team) }
    it { should validate_presence_of(:player) }
    it {
      FactoryGirl.create(:tournament_team_player)
      should validate_uniqueness_of(:player_id)
              .scoped_to(:tournament_team_id)
    }
  end

  describe "Relationships" do
    it { should belong_to(:player)
                  .class_name('Player::Base') }
    it { should belong_to(:tournament_team)
                  .class_name('Tournament::Team') }
  end
end

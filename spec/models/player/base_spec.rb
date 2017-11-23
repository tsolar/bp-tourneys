require "rails_helper"

RSpec.describe Player::Base, type: :model do
  describe "relationships" do
    it {
      should have_many(:tournament_team_players)
        .class_name("Tournament::TeamPlayer")
        .inverse_of(:player)
    }
  end

  describe "#to_s" do
    it "should return player name" do
      player = FactoryGirl.create(:player_basis, name: "Name 1")
      expect("#{player}").to eq player.name
    end
  end
end

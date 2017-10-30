require 'rails_helper'

RSpec.describe Tournament::TeamPlayer, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:tournament_team) }
    it { should validate_presence_of(:tournament) }
    it { should validate_presence_of(:player) }

    # Shoulda matchers is not working for this
    # it {
    #   FactoryGirl.create(:tournament_team_player)
    #   should validate_uniqueness_of(:player_id)
    #     .scoped_to(:tournament_id)
    # }

    it "should validate uniqueness of player in tournament" do
      tt1 = FactoryGirl.create(:tournament_team)
      tt2 = FactoryGirl.create(:tournament_team, tournament: tt1.tournament)
      expect(tt1.tournament).to eq tt2.tournament
      tt3 = FactoryGirl.create(:tournament_team)
      expect(tt1.tournament).not_to eq tt3.tournament

      ttp1 = FactoryGirl.create(:tournament_team_player, tournament_team: tt1)
      expect(ttp1).to be_valid
      expect(ttp1).to be_persisted
      ttp2 = FactoryGirl.build(
        :tournament_team_player,
        player: ttp1.player,
        tournament_team: tt2
      )
      expect(ttp2).not_to be_valid
      expect(ttp2.save).to be false

      ttp3 = FactoryGirl.build(
        :tournament_team_player,
        player: ttp1.player,
        tournament_team: tt3
      )
      expect(ttp3).to be_valid
      expect(ttp3.save).to be true
    end

    it 'should validate tournament is the same of tournament team' do
      ttp = FactoryGirl.create(:tournament_team_player)
      expect(ttp.tournament).to eq ttp.tournament_team.tournament
    end
  end

  describe "Relationships" do
    it {
      should belong_to(:player)
        .class_name('Player::Base')
        .inverse_of(:tournament_team_players)
    }

    it {
      should belong_to(:tournament_team)
        .class_name('Tournament::Team')
    }

    it {
      should belong_to(:tournament)
        .class_name('Tournament::Base')
    }
  end
end
